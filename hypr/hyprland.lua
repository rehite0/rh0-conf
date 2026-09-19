
require("hooks")
require("my_bind")
require("dms.colors")
require("dms.outputs")
require("dms.layout")
require("dms.cursor")
require("dms.binds")
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "1",
})


hl.workspace_rule({
    workspace = "10",
    layout = "scrolling",
})

hl.workspace_rule({
    workspace = "5",
    layout = "scrolling",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 3,
    bezier = "default",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3,
    bezier = "default",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "default",
})
hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 4,
    bezier = "default",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "default",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 3,
    bezier = "default",
})

hl.window_rule({
    match = {
        class = "^(org\\.wezfurlong\\.wezterm)$",
    },
    float = false,
})

hl.window_rule({
    match = {
        class = "^(org\\.gnome\\.)",
    },
    rounding = 12,
})

hl.window_rule({
    match = {
        class = "^(gnome-control-center)$",
    },
    float = false,
})

hl.window_rule({
    match = {
        class = "^(pavucontrol)$",
    },
    float = false,
})

hl.window_rule({
    match = {
        class = "^(nm-connection-editor)$",
    },
    float = false,
})

hl.window_rule({
    match = {
        class = "^(gnome-calculator)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(galculator)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(blueman-manager)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(org\\.gnome\\.Nautilus)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(xdg-desktop-portal)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(steam)$",
        title = "^(notificationtoasts)",
    },
    no_initial_focus = true,
    pin = true,
})

hl.window_rule({
    match = {
        class = "^(firefox)$",
        title = "^(Picture-in-Picture)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(zoom)$",
    },
    float = true,
})

hl.layer_rule({
    match = { namespace = "match:namespace ^(quickshell)$" },
    -- TODO: manual review — unmapped layer rule: "no_anim on"
})

hl.layer_rule({
    match = { namespace = "match:namespace ^dms:.*" },
    -- TODO: manual review — unmapped layer rule: "no_anim on"
})

hl.config({
    input = {
        kb_layout = "us",
        numlock_by_default = true,
        sensitivity = 0.5,
        force_no_accel = true,
        follow_mouse = 1,
    },
    -- ==================
    -- GENERAL LAYOUT
    -- ==================
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        layout = "dwindle",
    },
    -- ==================
    -- DECORATION
    -- ==================
    decoration = {
        rounding = 12,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 30,
            render_power = 5,
            offset = "0 5",
            color = "rgba(00000070)",
        },
    },
    -- ==================
    -- ANIMATIONS
    -- ==================
    animations = {
        enabled = true,
    },
    -- ==================
    -- LAYOUTS
    -- ==================
    dwindle = {
        preserve_split = true,
    },
    master = {
        mfact = 0.5,
    },
    scrolling = {
        fullscreen_on_one_column = true,
        follow_focus = true,
        follow_min_visible = 0.4,
        column_width = 0.75,
        direction = "right",
        wrap_focus = true,
        wrap_swapcol = true,
    },
    -- ==================
    -- MISC
    -- ==================
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },
    -- ==================
    -- WINDOW RULES
    -- ==================
    -- DMS windows floating by default
    -- ! Hyprland doesn't size these windows correctly so disabling by default here
    -- windowrule = float on, match:class ^(org.quickshell)$
})

