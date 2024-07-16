function ff
    if test -z "$SSH_CLIENT"
        fastfetch $argv
        return
    end

    fastfetch -c ~/.config/fastfetch/config-ssh.jsonc $argv
end
