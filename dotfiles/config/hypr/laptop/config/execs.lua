-- You can make apps auto-start here
-- Relevant Hyprland wiki section: https://wiki.hyprland.org/Configuring/Keywords/#executing
hl.on("hyprland.start", function()
	hl.exec_cmd("nm-applet")

	hl.exec_cmd("~/dots/dotfiles/config/hypr/shared/scripts/is-not-home.sh 3 zen-browser", { workspace = "1 silent" })
	hl.exec_cmd("~/dots/dotfiles/config/hypr/shared/scripts/is-not-home.sh 0 kitty", { workspace = "2 silent" })
	hl.exec_cmd("~/dots/dotfiles/config/hypr/shared/scripts/is-not-home.sh 0 kitty", { workspace = "3 silent" })
	hl.exec_cmd("~/dots/dotfiles/config/hypr/shared/scripts/is-not-home.sh 0 kitty", { workspace = "3 silent" })
	hl.exec_cmd(
		'~/dots/dotfiles/config/hypr/shared/scripts/is-not-home.sh 3 "equibop --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto"',
		{ workspace = "4 silent" }
	)
	hl.exec_cmd(
		'~/dots/dotfiles/config/hypr/shared/scripts/is-not-home.sh 3 "ferdium --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto"',
		{ workspace = "4 silent" }
	)
	hl.exec_cmd("~/dots/dotfiles/config/hypr/shared/scripts/is-not-home.sh 5 thunderbird", { workspace = "6 silent" })
	hl.exec_cmd("~/dots/dotfiles/config/hypr/shared/scripts/is-home.sh 0 waynergy", { workspace = "9 silent" })
end)
