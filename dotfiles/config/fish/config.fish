if test -e ~/.environment_variables
    export (cat ~/.environment_variables |xargs -L 1)
end

if status is-interactive
    n
end

zoxide init --cmd cd fish | source
oh-my-posh init fish --config ~/.config/oh-my-posh/config.json | source
