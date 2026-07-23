local browser = "firefox"
local discord = "discord"
local fileManager = "dolphin"
local mainMod = "SUPER"
local menu = "wofi -n"
local terminal = "kitty"

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar -c ~/.config/waybar/hypr/config -s ~/.config/waybar/hypr/style.css")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("sleep .5 && awww restore")
    hl.exec_cmd("swaync")
    hl.exec_cmd("pypr")
    hl.exec_cmd("swaync-client -df")
    hl.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ 0")
    hl.exec_cmd("easyeffects --service-mode")
    hl.exec_cmd("clip-organizer")
    hl.exec_cmd("/etc/nixos/scripts/clip.sh")
end)

hl.monitor({
    output = "DP-1",
    mode = "1920x1080@240.00",
    position = "0x0",
    scale = "1",
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@74.97",
    position = "-1920x0",
    scale = "1",
})

hl.device({
    name = "xppen-deco-01-v3-pen",
    output = "DP-1",
})

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "12")

hl.layer_rule({
    match = { namespace = "selection" },
    no_anim = true,
})

hl.config({
    animations = {
        enabled = true,
    },
    decoration = {
        blur = {
            enabled = true,
            ignore_opacity = true,
            new_optimizations = true,
            passes = 5,
            popups = true,
            size = 3,
            xray = false,
        },
        shadow = {
            color = "rgba(0,0,0,.5)",
            enabled = true,
            range = 15,
            render_power = 5,
        },
        active_opacity = 0.780000,
        fullscreen_opacity = 1,
        inactive_opacity = 0.700000,
        rounding = 10,
    },
    dwindle = {
        preserve_split = true,
    },
    general = {
        allow_tearing = false,
        border_size = 0,
        gaps_in = 2,
        gaps_out = 10,
        layout = "dwindle",
        resize_on_border = false,
    },
    input = {
        touchpad = {
            natural_scroll = true,
        },
        follow_mouse = 1,
        kb_layout = "us",
        sensitivity = 0,
    },
    misc = {
        disable_hyprland_logo = true,
        focus_on_activate = true,
        force_default_wallpaper = -1,
    },
})


hl.curve("fluid", { type = "bezier", points = { { 0.15, 0.85 }, { 0.25, 1 } } })
hl.curve("snappy", { type = "bezier", points = { { 0.3, 1 }, { 0.4, 1 } } })

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 3,
    bezier = "fluid",
    style = "popin 5%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 2.5,
    bezier = "snappy",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 4,
    bezier = "snappy",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 1.7,
    bezier = "snappy",
    style = "slide",
})

hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 4,
    bezier = "fluid",
    style = "slidefadevert -35%",
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 2,
    bezier = "snappy",
    style = "popin 70%",
})

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(discord))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("xournalpp"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("kopuz"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + CTRL + Z", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + CTRL + X", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("ALT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("ALT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("ALT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind("ALT + down", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots/"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("obs-cmd replay save"))
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("pypr toggle term"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("pypr toggle music"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("pypr toggle taskbar"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("pypr toggle files"))
hl.bind("F8", hl.dsp.exec_cmd("/etc/nixos/scripts/toggle-tablet.sh"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())
