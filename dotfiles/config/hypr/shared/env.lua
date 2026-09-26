-- Variables (globals, so require()d consumers see them)
mainMod = "SUPER" -- Sets "Windows" key as main modifier
terminal = "ghostty"

-- You can put extra environment variables here
-- https://wiki.hyprland.org/Configuring/Environment-variables/
-- hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("BROWSER", "zen-browser")
-- hl.env("GBM_BACKEND", "nvidia-drm")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
-- hl.env("WLR_NO_HARDWARE_CURSORS", "1")
-- hl.env("__NV_PRIME_RENDER_OFFLOAD", "1")
hl.env("HYPRCURSOR_THEME", "Breeze5_Snow")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XCURSOR_THEME", "Breeze5_Snow")
hl.env("XCURSOR_SIZE", "24")

hl.env("EDITOR", "nvim")
