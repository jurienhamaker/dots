function atac
    set -x ATAC_KEY_BINDINGS '/home/jurien/.config/atac/keybindings.toml'
    command atac --directory ~/.config/atac $argv
end
