function tmux --wraps='tmux'
    switch (uname)
    case Linux
        /home/linuxbrew/.linuxbrew/bin/tmux -f ~/.config/tmux.conf $argv
    case Darwin
        /opt/homebrew/bin/tmux -f ~/.config/tmux.conf $argv
    case '*'
        echo I dunno what system youre on, but it aint one of mine
    end
end
