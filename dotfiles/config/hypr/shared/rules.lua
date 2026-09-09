-- You can put custom rules here
-- Window/layer rules: https://wiki.hyprland.org/Configuring/Window-Rules/

-- example window rules
-- for windows named/classed as abc and xyz

-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
hl.window_rule({ match = { class = "^(nm-connection-editor)$" }, float = true })
hl.window_rule({ match = { class = "^(telegramdesktop)$", title = "^(Media viewer)$" }, float = true })
hl.window_rule({ match = { class = "^(code)$", title = "^(Open Folder)$" }, float = true })
hl.window_rule({ match = { class = "^(firefox)$", title = "^(Firefox — Sharing Indicator)$" }, float = true })
hl.window_rule({ match = { class = "^(zen-alpha)$", title = "^(Zen Browser — Sharing Indicator)$" }, float = true })

-- Firefox floating PiP
hl.window_rule({ match = { class = "(firefox)", title = "(Picture-in-Picture)" }, float = true })
hl.window_rule({ match = { class = "(firefox)", title = "(Picture-in-Picture)" }, pin = true })

-- Zen floating PiP
hl.window_rule({ match = { class = "(zen)", title = "(Picture-in-Picture)" }, float = true })
hl.window_rule({ match = { class = "(zen)", title = "(Picture-in-Picture)" }, pin = true })

-- Window workspace rules
hl.window_rule({ match = { class = "^(firefox)$" }, workspace = "1" })
hl.window_rule({ match = { class = "^(zen-alpha)$" }, workspace = "1" })
hl.window_rule({ match = { class = "^(Ferdium)$" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^(Rambox)$" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^(vesktop)$" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^(equibop)$" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^(GitKraken)$" }, workspace = "5 silent" })
hl.window_rule({ match = { class = "^(Slack)$" }, workspace = "6 silent" })
hl.window_rule({ match = { class = "^(Mailspring)$" }, workspace = "6 silent" })
hl.window_rule({ match = { class = "^(Thunderbird)$" }, workspace = "6 silent" })
hl.window_rule({ match = { title = "^(Spotify)$" }, workspace = "7 silent" })

-- Kitty transparency
hl.window_rule({ name = "opacity_kitty", match = { class = "^(kitty)$" }, opacity = 0.8 })

-- Ghostty transparency
hl.window_rule({ name = "opacity_ghostty", match = { class = "^(com.mitchellh.ghostty)$" }, opacity = 0.8 })

-- Discord transparency
hl.window_rule({ match = { class = "^(vesktop)$" }, opacity = 0.95 })
hl.window_rule({ match = { class = "^(equibop)$" }, opacity = 0.95 })

-- Ferdium transparency
hl.window_rule({ match = { class = "^(Ferdium)$" }, opacity = 0.95 })

-- Ferdium transparency
hl.window_rule({ match = { class = "^(rambox)$" }, opacity = 0.95 })

-- Firefox transparency
hl.window_rule({ match = { class = "^(firefox)$" }, opacity = 0.99 })

-- Zen browser transparency
hl.window_rule({ match = { class = "^(zen-alpha)$" }, opacity = 0.99 })

-- Gitkraken transparency
hl.window_rule({ match = { class = "^(Gitkraken)$" }, opacity = 0.95 })

-- Slack transparency
hl.window_rule({ match = { class = "^(Slack)$" }, opacity = 0.99 })

-- Mailspring transparency
hl.window_rule({ match = { class = "^(Mailspring)$" }, opacity = 0.95 })
hl.window_rule({ match = { class = "^(Thunderbird)$" }, opacity = 0.95 })
