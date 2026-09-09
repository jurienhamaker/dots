local HOME = os.getenv("HOME")
package.path = HOME .. "/dots/dotfiles/config/hypr/?.lua;" .. package.path

-- Ambxst (loaded first; provides its own binds/rules/animations)
require(HOME .. "/.local/share/ambxst/hyprland.lua")

require("shared.theme")
require("shared.env")
require("shared.general")
require("shared.keybinds")
require("shared.rules")
require("shared.execs")

require("pc.config.env")
require("pc.config.monitors")
require("pc.config.execs")
require("pc.config.macropad-keybinds")
require("pc.config.input")
require("pc.config.rules")
