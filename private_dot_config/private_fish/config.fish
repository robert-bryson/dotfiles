if status is-interactive
    # Commands to run in interactive sessions
    rbenv init - fish | source
    starship init fish | source
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

