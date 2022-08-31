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

    echo 'updating tldr cache..'
    tldr --update

    echo 'updating vim plug..'
    vim -es -u vimrc -i NONE -c "PlugUpgrade" -c "qa"
    echo 'updating vim plugins'
    vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"
    vim -es -u vimrc -i NONE -c "PlugUpdate" -c "qa"
    echo 'updating neovim plug..'
    nvim -es -u init.vim -i NONE -c "PlugUpgrade" -c "qa"
    echo 'updating neovim plugins..'
    nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"
    nvim -es -u init.vim -i NONE -c "PlugUpdate" -c "qa"

    echo 'updating coc.vim..'
    # from https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#update-extensions
    vim -c 'CocUpdateSync|q'

    # TODO
    #echo 'fetching git repo updates'
    #cd /Users/rob/work/repos
    #for repo in repos_to_keep_updated

    echo 'Checking OS specfic things..'
    switch (uname)
        case Linux
            echo 'Updating linuxy things..'
            sudo apt update
            sudo apt upgrade --yes
        case Darwin
            echo 'Updating macos things..'
            # TODO
            echo 'Looks like you havent done anything here?'
        case '*'
            echo 'Which os are you?'
    end
end
