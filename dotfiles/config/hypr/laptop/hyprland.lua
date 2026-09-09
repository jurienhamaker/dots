local HOME = os.getenv("HOME")
package.path = HOME .. "/dots/dotfiles/config/hypr/?.lua;" .. package.path

-- Ambxst (loaded first; provides its own binds/rules/animations)
dofile(HOME .. "/.local/share/ambxst/hyprland.lua")

require("shared.theme")
require("shared.env")
require("shared.general")
require("shared.keybinds")
require("shared.rules")
require("shared.execs")

require("laptop.config.general")
require("laptop.config.monitors")
require("laptop.config.execs")
