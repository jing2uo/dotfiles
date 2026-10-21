-- Keybinds and gestures.
-- Was: the bind/binde/bindm/gesture lines of hyprland.conf, plus the tail of
-- rule.conf. Merged so mainMod is declared once.

local mainMod = "ALT"

-- apt install alacritty fcitx5 uwsm
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
hl.bind(mainMod .. " + X", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + T", hl.dsp.group.toggle())

-- Audio Brightness Ctrl
-- apt install brightnessctl pulseaudio-utils
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))

-- workspace
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + UP", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + DOWN", hl.dsp.focus({ workspace = "e-1" }))

-- monitor: move the active workspace to the next/previous monitor
local function move_workspace_to(monitor)
	return function()
		local w = hl.get_active_workspace()
		if w then
			hl.dispatch(hl.dsp.workspace.move({ workspace = w.id, monitor = monitor }))
		end
	end
end
hl.bind(mainMod .. " + SHIFT + N", move_workspace_to("+1"))
hl.bind(mainMod .. " + SHIFT + M", move_workspace_to("-1"))

-- Move (mainMod + JLIK) / resize (mainMod + SHIFT + JLIK) windows
for key, d in pairs({ J = { -1, 0 }, L = { 1, 0 }, I = { 0, -1 }, K = { 0, 1 } }) do
	local x, y = d[1], d[2]
	hl.bind(mainMod .. " + " .. key, hl.dsp.window.move({ x = x * 20, y = y * 20, relative = true }), { repeating = true })
	hl.bind(
		mainMod .. " + SHIFT + " .. key,
		hl.dsp.window.resize({ x = x * 10, y = y * 10, relative = true }),
		{ repeating = true }
	)
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
