hl.config({
	general = { layout = "dwindle", resize_on_border = false, allow_tearing = false },
	master = { new_status = "master" },
	dwindle = { preserve_split = true },
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = -0.5,
		touchpad = { natural_scroll = false },
	},
	cursor = { no_warps = true, enable_hyprcursor = true },
	decoration = {
		blur = { enabled = true, new_optimizations = true, contrast = 1, brightness = 1, vibrancy = 0.1696 },
		shadow = { render_power = 2 },
	},
	misc = { force_default_wallpaper = 0, disable_hyprland_logo = true, middle_click_paste = false },
})

hl.device({ name = "logitech-usb-receiver", accel_profile = "flat" })
hl.device({ name = "logitech-g502-x-plus", accel_profile = "flat" })
hl.device({ name = "logitech-g502-x-plus-1", accel_profile = "flat" })

-- Default animations, see https://wiki.hypr.land/Configuring/Animations/ for more
hl.curve("customBezier", { type = "bezier", points = { { 0.4, 0.0 }, { 0.2, 1.0 } } })
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- Trailing overrides (must come last so they win, as in the source .conf)
hl.animation({ leaf = "windows", enabled = true, speed = 2.5, bezier = "customBezier", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 2.5, bezier = "customBezier" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.5, bezier = "customBezier" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2.5, bezier = "customBezier", style = "slidefade 20%" })
