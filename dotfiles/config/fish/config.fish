if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test -z "$SSH_CLIENT"
    n
end

zoxide init --cmd cd fish | source

if test ! -z "$SSH_CLIENT"
    starship init fish | source
end
