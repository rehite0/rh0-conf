#rh0-Qtile config

from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = "alacritty"

keys = [
    # list of commands at https://docs.qtile.org/en/latest/manual/config/lazy.html

    #mod
    Key([mod],  "h",    lazy.layout.left(),     desc="Move focus to left"),
    Key([mod],  "l",    lazy.layout.right(),    desc="Move focus to right"),
    Key([mod],  "j",    lazy.layout.down(),     desc="Move focus down"),
    Key([mod],  "k",    lazy.layout.up(),       desc="Move focus up"),
    Key([mod],  "space",lazy.layout.next(),     desc="Move window focus to other window"),

    Key([mod], "Return",lazy.spawn(terminal),           desc="Launch terminal"),
    Key([mod], "Tab",   lazy.next_layout(),             desc="Toggle between layouts"),
    Key([mod], "q",     lazy.window.kill(),             desc="Kill focused window"),
    Key([mod], "f",     lazy.window.toggle_floating(),  desc="Toggle floating on focused window"),
    Key([mod], "m",     lazy.window.toggle_fullscreen(),desc="Toggle fullscreen on focused window",),
    Key([mod], "r",     lazy.spawncmd(),                desc="Spawn a command using a prompt widget"),
    Key([mod], "i",     lazy.layout.increase_ratio() ,  desc="increase space for master window"),
    Key([mod], "o",     lazy.layout.decrease_ratio() ,  desc="decrease space for master window"),
    #kc to change group of current window
   
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
    Key([mod, "control"], "q",      lazy.shutdown(), desc="Shutdown Qtile"),

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
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(i) for i in "123456789"]

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
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
layout_theme={'border_focus':"#d75f5f",'border_normal':"#8f3d3d", 'border_width':4, 'margin':10}
layouts = [
    layout.MonadTall(**layout_theme,new_client='top',ratio=0.6),
    layout.Max(**layout_theme),
    layout.Stack(**layout_theme,num_stacks=2),
    layout.TreeTab(**layout_theme),
    # layout.Columns(**layout_theme),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(**layout_theme),
    # layout.Tile(**layout_theme),
    # layout.VerticalTile(),
    # layout.Zoomy(),
    # layout.slice(),
    # layout.spiral(),
    # layout.floating(),
]

screens = [
    Screen(
        bottom=bar.Bar(
            widgets=[
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("default config", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                widget.QuickExit(),
            ],
            size=24,
            background=['#ffffff00','#ff0000e0'],
            border_width=[0, 0, 0, 0],  # Draw top and bottom borders
            margin=[0,0,0,0],
            #border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # x11_drag_polling_rate = 60,
        wallpaper='./HH.jpg',
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
    ]
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

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()


# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None
# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

wmname = "LG3D"
