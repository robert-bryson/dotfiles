function update --description 'Updates, used before upgrade'
    # link bash's set -x
    set fish_trace 1

    echo 'updating chezmoi..'
    chezmoi update --verbose

    echo 'updating fisher..'
    fisher update

    echo 'updating brew..'
    brew update
    brew outdated
    brew upgrade
    brew upgrade --greedy

    echo 'updating tldr cache'
    tldr --update

    echo 'updating vim plug'
    vim +'PlugUpgrade --sync' +qa
    echo 'updating vim plugins'
    vim +'PlugInstall --sync' +qa
    vim +'PlugUpdate --sync' +qa

    #echo 'fetching git repo updates'
    #cd /Users/rob/work/repos
    #for 

    echo 'Checking OS specfic things..'
    switch (uname)
        case Linux
            echo 'Updating linuxy things..'
            sudo apt update
            sudo apt upgrade --yes
        case Darwin
            echo 'Updating macos things..'
        case '*'
            echo 'Which os are you?'
    end
end
