---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + ALT + Q", hl.dsp.exec_cmd("hyprctl kill")) -- Pick and kill a window

hl.bind(mainMod .. " + minus",      hl.dsp.layout("splitratio -0.1"), { repeating = true })
hl.bind(mainMod .. " + equal",      hl.dsp.layout("splitratio +0.1"), { repeating = true })
hl.bind(mainMod .. " + semicolon",  hl.dsp.layout("splitratio -0.1"), { repeating = true })
hl.bind(mainMod .. " + apostrophe", hl.dsp.layout("splitratio +0.1"), { repeating = true })

hl.bind(mainMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F",     hl.dsp.window.fullscreen())

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
