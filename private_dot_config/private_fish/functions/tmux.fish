function tmux --wraps='tmux'
    /opt/homebrew/bin/tmux -f ~/.config/tmux.conf $argv
end
