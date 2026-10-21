--## LOOK AND FEEL ###

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
for _, a in ipairs({
    { "windows", 7, "myBezier" },
    { "windowsOut", 7, "default", "popin 80%" },
    { "border", 10, "default" },
    { "borderangle", 8, "default" },
    { "fade", 7, "default" },
    { "workspaces", 6, "default" },
}) do
    hl.animation({ leaf = a[1], enabled = true, speed = a[2], bezier = a[3], style = a[4] })
end

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        -- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        col = {
            active_border = "rgba(F7DCDE39)",
            inactive_border = "rgba(A58A8D30)",
        },
        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,
        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "dwindle",
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration = {
        rounding = 3,
        -- https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
        },
    },
    group = {
        col = {
            border_active = "rgba(181825F5)",
        },
        groupbar = {
            indicator_height = 10,
            render_titles = false,
            col = {
                active = "rgba(181825F5)",
                inactive = "rgba(1E1E2ECC)",
            },
        },
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#animations
    animations = {
        enabled = true,
    },
})

hl.on("hyprland.start", function()
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Paper'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Paper'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'Sans'")
end)

