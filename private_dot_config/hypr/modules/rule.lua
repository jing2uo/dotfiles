-- Window rules. Was: ~/.config/hypr/rule.conf
-- The binde/bindm tail of rule.conf moved to bind.lua, so mainMod is only
-- declared in one place now.

-- Terminal
hl.window_rule({
    name = "windowrule-1",
    match = {
        class = "Alacritty",
    },
    workspace = "1",
})

-- Internet
hl.window_rule({
    name = "windowrule-2",
    match = {
        class = "app.zen_browser.zen",
    },
    workspace = "2",
})

-- Coding
hl.window_rule({
    name = "windowrule-3",
    match = {
        class = "code",
    },
    workspace = "3",
})

hl.window_rule({
    name = "windowrule-4",
    match = {
        class = "dev.zed.Zed",
    },
    workspace = "3",
})

-- wemeet
hl.window_rule({
    name = "windowrule-5",
    match = {
        class = "wemeetapp",
    },
    float = true,
    center = true,
    suppress_event = "activate",
})

hl.window_rule({
    name = "windowrule-6",
    match = {
        title = "EmojiFloatWnd",
    },
    workspace = "4 silent",
    suppress_event = "activate",
})

hl.window_rule({
    name = "windowrule-7",
    match = {
        title = "InMeeting_Float_Tips",
    },
    workspace = "4 silent",
    suppress_event = "activate",
})

-- note
hl.window_rule({
    name = "windowrule-8",
    match = {
        class = "obsidian",
    },
    workspace = "6",
})

hl.window_rule({
    name = "windowrule-9",
    match = {
        class = "calibre-gui",
    },
    workspace = "6",
})

-- richeasy
hl.window_rule({
    name = "windowrule-10",
    match = {
        class = "RichEZFast",
    },
    workspace = "9",
})

-- open file
hl.window_rule({
    name = "windowrule-11",
    match = {
        title = "(Bottles)",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-12",
    match = {
        title = "(Wine.*)",
    },
    center = true,
})

hl.window_rule({
    name = "windowrule-13",
    match = {
        class = "(TradingView)",
    },
    center = true,
})

hl.window_rule({
    name = "windowrule-14",
    match = {
        class = "(soffice|xdg-desktop-portal-gtk|hyprland-share-picker)",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-15",
    match = {
        class = "(.*copyq|Enpass|.*Calculator|explorer.exe|steam_proton)",
    },
    float = true,
    center = true,
})

hl.window_rule({
    name = "windowrule-16",
    match = {
        class = "(QQ|wechat)",
    },
    float = true,
    center = true,
})

hl.window_rule({
    name = "windowrule-17",
    match = {
        title = "(QQ|WeChat)",
    },
    size = "980 650",
})

hl.window_rule({
    name = "windowrule-18",
    match = {
        class = "(io.github.kukuruzka165.materialgram)",
    },
    float = true,
    center = true,
    size = "980 650",
})

hl.window_rule({
    name = "windowrule-19",
    match = {
        class = "(.*pavucontrol|xarchiver|(?i)thunar)",
    },
    float = true,
    center = true,
    size = "900 600",
})
