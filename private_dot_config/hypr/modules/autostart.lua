--- AUTOSTART ---
-- Was: the exec-once lines of hyprland.conf.

hl.on("hyprland.start", function()
	hl.exec_cmd("~/.local/bin/myterminal")
	hl.exec_cmd('echo "Xft.dpi: 180" | xrdb -merge -')
	hl.exec_cmd("fcitx5")
	hl.exec_cmd("awww-daemon")
	-- Clipboard: apt install wl-clipboard cliphist
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
