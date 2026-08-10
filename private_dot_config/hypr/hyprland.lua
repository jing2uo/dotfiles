-- Hyprland entry point.
-- Hyprland loads $XDG_CONFIG_HOME/hypr/hyprland.lua and resolves relative
-- require() paths against that directory, so no package.path setup is needed.
-- Subdirectories use the usual module syntax: require("modules.bind").
--
-- Everything Hyprland-specific lives in modules/ so that the top level stays
-- free for the companion tools (hypridle/hyprlock/hyprsunset), which only look
-- for their .conf flat in ~/.config/hypr/.
--
-- Mapping from the old hyprlang split-conf layout:
--   hyprland.conf -> hyprland.lua + modules/bind.lua + modules/autostart.lua
--   env.conf      -> modules/env.lua
--   look.conf     -> modules/look.lua
--   rule.conf     -> modules/rule.lua  (its binde/bindm tail went to bind.lua)
--   misc.conf     -> modules/misc.lua
--   monitors.conf -> modules/monitors.lua

require("modules.env")
require("modules.monitors")
require("modules.look")
require("modules.misc")
require("modules.rule")
require("modules.bind")
require("modules.autostart")
