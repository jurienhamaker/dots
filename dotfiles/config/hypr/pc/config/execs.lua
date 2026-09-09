-- You can make apps auto-start here
-- Relevant Hyprland wiki section: https://wiki.hyprland.org/Configuring/Keywords/#executing
hl.on("hyprland.start", function()
  hl.exec_cmd("sleep 3 && zen-browser", { workspace = "1 silent" })
  hl.exec_cmd("sleep 3 && equibop --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto", { workspace = "4 silent" })
  hl.exec_cmd("sleep 3 && /home/jurien/.local/share/applications/Rambox.AppImage --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto", { workspace = "4 silent" })
  hl.exec_cmd("sleep 5 && thunderbird", { workspace = "6 silent" })

  hl.exec_cmd("sleep 3 && /home/jurien/dots/dotfiles/config/hypr/pc/scripts/set-audio.sh Gaming true")

  hl.exec_cmd("coolercontrol")
  hl.exec_cmd("solaar --window=hide")
end)
