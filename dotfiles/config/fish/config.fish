if test -e ~/.environment_variables
    export (cat ~/.environment_variables |xargs -L 1)
end

if status is-interactive
    n
end

set -U fish_prompt_pwd_dir_length 1

export EDITOR=nvim
zoxide init --cmd cd fish | source
starship init fish | source
