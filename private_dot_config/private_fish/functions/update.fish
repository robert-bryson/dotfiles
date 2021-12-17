function update --description 'Updates, used before upgrade'
    echo
    echo 'updating brew..'
    brew update
    brew outdated
    brew upgrade

    echo
    echo 'updating tldr cache'
    tldr --update

    echo 'fetching git repo updates'
    cd /Users/rob/work/repos
    #for 
end
