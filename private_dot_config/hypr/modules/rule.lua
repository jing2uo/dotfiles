-- Window rules. Was: ~/.config/hypr/rule.conf
-- The binde/bindm tail of rule.conf moved to bind.lua, so mainMod is only
-- declared in one place now.

-- 按 class 固定 workspace
for _, r in ipairs({
	{ "terminal", "Alacritty", "1" },
	{ "browser", "app.zen_browser.zen", "2" },
	{ "coding", "code", "3" },
	{ "note", "(ko-panel|obsidian|calibre-gui)", "6" },
}) do
	hl.window_rule({
		name = "ws-" .. r[1],
		match = { class = r[2] },
		workspace = r[3],
	})
end

-- wemeet
hl.window_rule({
	name = "wemeet",
	match = { class = "wemeetapp" },
	float = true,
	center = true,
	suppress_event = "activate",
})

hl.window_rule({
	name = "wemeet-tips",
	match = { title = "(EmojiFloatWnd|InMeeting_Float_Tips)" },
	workspace = "4 silent",
	suppress_event = "activate",
})

-- 浮动
hl.window_rule({
	name = "float-center",
	match = { class = "(xdg-desktop-portal-gtk|hyprland-share-picker)" },
	float = true,
	center = true,
})

-- 浮动 + 居中 + 固定大小
hl.window_rule({
	name = "float-980x650",
	match = { class = "(.*pavucontrol|enpass|xarchiver|wechat|com.ayugram.desktop|org.flatpark.Cellar)" },
	float = true,
	center = true,
	size = "980 650",
})

hl.window_rule({
	name = "float-1100x700-strata",
	match = { class = "io.github.lgse.*" },
	float = true,
	center = true,
	size = "1100 700",
})

-- 截图工具: 自己会全屏, 别让它进平铺 (开/关时会挤动其它窗口)
hl.window_rule({
	name = "mark-shot",
	match = { class = "mark-shot" },
	float = true,
	pin = true,
	no_anim = true,
	no_shadow = true,
	no_blur = true,
	suppress_event = "maximize",
})
