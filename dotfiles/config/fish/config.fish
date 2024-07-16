if status is-interactive
    # Commands to run in interactive sessions can go here
end

n
zoxide init --cmd cd fish | source
oh-my-posh init fish --config ~/.config/oh-my-posh/config.json | source
