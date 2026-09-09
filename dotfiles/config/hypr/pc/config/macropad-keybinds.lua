hl.bind(mainMod .. " + KP_End",  hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + KP_Down", hl.dsp.exec_cmd("bolt"))
hl.bind(mainMod .. " + KP_Next", hl.dsp.exec_cmd(terminal .. ' -e fish -c "ve"'))
hl.bind(mainMod .. " + KP_Left", hl.dsp.exec_cmd("equibop"))

hl.bind("CTRL + SHIFT + ALT + 0", hl.dsp.exec_cmd("/home/jurien/dots/dotfiles/config/hypr/pc/scripts/toggle-audio.sh"))
hl.bind("CTRL + SHIFT + ALT + 1", hl.dsp.exec_cmd("/home/jurien/dots/dotfiles/config/hypr/pc/scripts/set-audio.sh Gaming"))
hl.bind("CTRL + SHIFT + ALT + 2", hl.dsp.exec_cmd("/home/jurien/dots/dotfiles/config/hypr/pc/scripts/set-audio.sh FIIO"))
