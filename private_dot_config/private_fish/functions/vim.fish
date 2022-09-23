function vim --wraps='vim'
    switch (uname)
    case Linux
        /home/linuxbrew/.linuxbrew/bin/nvim $argv
    case Darwin
        /opt/homebrew/bin/nvim $argv
    case '*'
        echo I dunno what system youre on, but it aint one of mine
    end
end
