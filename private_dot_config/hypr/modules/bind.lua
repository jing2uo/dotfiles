-- Keybinds and gestures.
-- Was: the bind/binde/bindm/gesture lines of hyprland.conf, plus the tail of
-- rule.conf. Merged so mainMod is declared once.

local mainMod = "ALT"

-- apt install alacritty fcitx5 uwsm
local terminal = "alacritty"
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("~/.local/bin/myterminal"))

-- Menu
-- apt install rofi
local menu = "rofi"
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu .. " -show drun"))

-- wifi
-- apt install iwd systemd-resolved
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("mise x -- iwmenu -l " .. menu .. " -i font -s 3"))

-- bluetooth
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("mise x -- bzmenu -l " .. menu .. " -i font -s 3"))

-- Clipboard
-- apt install wl-clipboard cliphist
hl.bind(
	mainMod .. " + V",
	hl.dsp.exec_cmd("cliphist list | " .. menu .. " -dmenu -case-smart | cliphist decode | wl-copy")
)

-- ScreenShot
-- flatpak install io.github.jswysnemc.MarkShot
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("flatpak run io.github.jswysnemc.MarkShot"))

-- hyprpicker
-- NOTE: Alt+I is bound twice (also "move window up" below). Same as in the old
-- hyprlang config; the first registered bind wins, so hyprpicker does.
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("hyprpicker -a"))

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
hl.gesture({
	fingers = 3,
	direction = "vertical",
	action = "fullscreen",
})

-- Key Bind
-- apt install wlogout
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(mainMod .. " + Z", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
-- fix: generator emitted mode = "", which hl rejects (expects fullscreen/maximized)
hl.bind(mainMod .. " + X", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + T", hl.dsp.group.toggle())

-- Audio Brightness Ctrl
-- apt install brightnessctl pulseaudio-utils
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute 0 toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute 0 toggle"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))

-- workspace
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + UP", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + DOWN", hl.dsp.focus({ workspace = "e-1" }))

-- monitor
-- fix: generator emitted monitor = -1 (number) for the second one; relative
-- monitor selectors must be strings, like the "+1" above.
hl.bind(mainMod .. " + SHIFT + N", function()
	local w = hl.get_active_workspace()
	if not w then
		return
	end
	hl.dispatch(hl.dsp.workspace.move({ workspace = w.id, monitor = "+1" }))
end)
hl.bind(mainMod .. " + SHIFT + M", function()
	local w = hl.get_active_workspace()
	if not w then
		return
	end
	hl.dispatch(hl.dsp.workspace.move({ workspace = w.id, monitor = "-1" }))
end)

-- Move windows with mainMod + arrow keys
hl.bind(mainMod .. " + J", hl.dsp.window.move({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + L", hl.dsp.window.move({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + I", hl.dsp.window.move({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind(mainMod .. " + K", hl.dsp.window.move({ x = 0, y = 20, relative = true }), { repeating = true })

-- Resize windows with mainMod + arrow keys
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

-- Move/resize windows with mainMod + LMB/RMB and dragging
-- fix: generator dropped { mouse = true }, which bindm needs
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
