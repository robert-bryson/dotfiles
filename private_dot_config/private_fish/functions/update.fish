function update --description 'Updates, used before upgrade'
    echo
    echo 'updating chezmoi..
    chezmoi update --verbose

    echo
    echo 'updating brew..'
    brew update
    brew outdated
    brew upgrade
    brew upgrade --greedy

    echo
    echo 'updating tldr cache'
    tldr --update

    echo
    echo 'updating vim plug'
    vim +'PlugUpgrade --sync' +qa
    echo 'updating vim plugins'
    vim +'PlugInstall --sync' +qa
    vim +'PlugUpdate --sync' +qa

    #echo 'fetching git repo updates'
    #cd /Users/rob/work/repos
    #for 
end
