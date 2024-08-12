#rh0-Qtile config

from libqtile import bar, layout, qtile, widget, hook #,extension
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
import os

mod = "mod4"
#terminal = "alacritty"

@lazy.function
def l_change_layout(qtile,l):
    qtile.current_group.layout=l

keys = [
    # list of commands at https://docs.qtile.org/en/latest/manual/config/lazy.html

    #mod
    Key([mod],  "h",    lazy.layout.left(),     desc="Move focus to left"),
    Key([mod],  "l",    lazy.layout.right(),    desc="Move focus to right"),
    Key([mod],  "j",    lazy.layout.down(),     desc="Move focus down"),
    Key([mod],  "k",    lazy.layout.up(),       desc="Move focus up"),
    Key([mod],  "space",lazy.layout.next(),     desc="Move window focus to other window"),

    Key([mod], "Return",lazy.spawn('alacritty'),        desc="Launch terminal"),
    Key([mod], "Tab",   lazy.next_layout(),             desc="Toggle between layouts"),
    Key([mod], "q",     lazy.window.kill(),             desc="Kill focused window"),
    Key([mod], "f",     lazy.window.toggle_floating(),  desc="Toggle floating on focused window"),
    Key([mod], "m",     lazy.window.toggle_fullscreen(),desc="Toggle fullscreen on focused window",),
    Key([mod], "r",     lazy.spawncmd(),                desc="Spawn a command using a prompt widget"),
    Key([mod], "plus",  lazy.layout.increase_ratio() ,  desc="increase space for master window"),
    Key([mod], "minus", lazy.layout.decrease_ratio() ,  desc="decrease space for master window"),
    #Key([mod], "slash",  ,desc="key bindings"),
    #Key([mod], "period",lazy.next_screen(),             desc='Move focus to next monitor'),
    #Key([mod], "comma", lazy.prev_screen(),             desc='Move focus to prev monitor'),


    KeyChord([mod], 'e',
             [
                 Key([], '1', l_change_layout('monadtall')),
                 Key([], '2', l_change_layout('max')),
                 Key([], '3', l_change_layout('monadwide')),
                 Key([], '4', l_change_layout('tile')),
                 Key([], '5', l_change_layout('stack')),
                 Key([], '6', l_change_layout('treetab')),
                 Key([], '7', l_change_layout('ratiotile')),
                 Key([], '0', l_change_layout('floating')),
                 ]),
    KeyChord([mod], 'w',
        [Key([], '1', lazy.window.togroup("1",switch_group=False),desc="move focused window to group 1")
        ,Key([], '2', lazy.window.togroup("2",switch_group=False),desc="move focused window to group 2")
        ,Key([], '3', lazy.window.togroup("3",switch_group=False),desc="move focused window to group 3")
        ,Key([], '4', lazy.window.togroup("4",switch_group=False),desc="move focused window to group 4")
        ,Key([], '5', lazy.window.togroup("5",switch_group=False),desc="move focused window to group 5")
        ,Key([], '6', lazy.window.togroup("6",switch_group=False),desc="move focused window to group 6")
        ,Key([], '7', lazy.window.togroup("7",switch_group=False),desc="move focused window to group 7")
        ,Key([], '8', lazy.window.togroup("8",switch_group=False),desc="move focused window to group 8")
        ]),


    #mod-shift
    Key([mod,   "shift"],   "h",    lazy.layout.shuffle_left(),     desc="Move window to the left"),
    Key([mod,   "shift"],   "l",    lazy.layout.shuffle_right(),    desc="Move window to the right"),
    Key([mod,   "shift"],   "j",    lazy.layout.shuffle_down(),     desc="Move window down"),
    Key([mod,   "shift"],   "k",    lazy.layout.shuffle_up(),       desc="Move window up"),

    Key([mod,   "shift"],"Return",lazy.layout.toggle_split(),
        desc="toggle between split and unsplit sides of stack"),

    #mod-cnt
    Key([mod, "control"], "h",      lazy.layout.grow_left(),        desc="Grow window to the left"),
    Key([mod, "control"], "l",      lazy.layout.grow_right(),       desc="Grow window to the right"),
    Key([mod, "control"], "j",      lazy.layout.grow_down(),        desc="Grow window down"),
    Key([mod, "control"], "k",      lazy.layout.grow_up(),          desc="Grow window up"),

    Key([mod, "control"], "space",  lazy.layout.normalize(),        desc="Reset all window sizes"),
    Key([mod, "control"], "r",      lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "x",      lazy.shutdown(), desc="Shutdown Qtile"),

    #sys ctl
    ##

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    # Toggle between different layouts as defined below
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
'''
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )
'''
# name, lable,layout,;;layouts,spawn
groups_name=[('1','...','monadtall')
            ,('2','yt','treetab')
            ,('3','</>','stack')
            ,('4','>_','monadwide')
            ,('5','bro�','treetab')
            ,('6','doc','monadtall')
            ,('7','sys','ratiotile')
            ,('8','ch','tile')
            ]


groups=[]
for i in groups_name:
    groups.append(Group(  name=i[0]
                        ,layout=i[2]
                        ,label=i[1]))
for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
                ),
        ]
    )

layout_theme={'border_focus':"#f5a031",'border_normal':"#f7d48d", 'border_width':5, 'margin':6}
#d75f5f,#8f3d3d
layouts = [
    layout.MonadTall(**layout_theme,new_client='top',ratio=0.6),
    layout.Max(**layout_theme),
    layout.Stack(**layout_theme,num_stacks=2),
    layout.TreeTab(**layout_theme),
    layout.Tile(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Floating(**layout_theme),
    # layout.Columns(**layout_theme),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
    # layout.slice(),
    # layout.spiral(),
]


wigt=   [widget.CurrentLayout()
        ,widget.GroupBox()
        ,widget.Prompt()
        ,widget.WindowName()
        ,widget.Chord(
                chords_colors={"launch": ("#ff0000", "#ffffff")},
                name_transform=lambda name: name.upper(),
            )
        ,widget.TextBox("default config", name="default")
        ,widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f")
        ,widget.Systray()
        ,widget.Clock(format="%Y-%m-%d %a %I:%M %p")
        ,widget.QuickExit()
        ]

screens=[
    Screen(
        top=bar.Bar(
            widgets=wigt,
            size=24,
            background=['#ffffff00','#ff0000e0'],
            border_width=[0, 0, 0, 0],
            margin=[0,0,0,0],
            #border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # x11_drag_polling_rate = 60,
        wallpaper=os.path.expanduser('~')+'/.config/qtile/HH.jpg',
        wallpaper_mode='fill',
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],**layout_theme
)
floats_kept_above = True
bring_front_click = 'floating_only'
follow_mouse_focus = True
auto_fullscreen = True
auto_minimize = True
focus_on_window_activation = "smart"
reconfigure_screens = True
cursor_warp = False

dgroups_key_binder = None
dgroups_app_rules = []  # type: list

widget_defaults = dict(font="sans",fontsize=12,padding=3)
extension_defaults = widget_defaults.copy()


# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None
# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

wmname = "qtile"

hook.subscribe.startup_once(lazy.spawn(os.path.expanduser('~')+'/.config/autostart/autostart.sh'))
