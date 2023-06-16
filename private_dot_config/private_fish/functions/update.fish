function update --description 'Updates, used before upgrade'
    # TODO - add this as a flag like --test or something
    # link bash's set -x
    #set fish_trace 1

    echo 'updating chezmoi..'
    chezmoi update --verbose

    echo 'updating fisher..'
    fisher update

    echo 'updating brew..'
    brew update
    brew outdated
    brew upgrade
    brew cleanup

    echo 'updating tldr cache..'
    tldr --update

    echo 'updating neovim plug..'
    nvim -u ~/.config/nvim/init.vim '+PlugUpgrade' '+qa!' > /dev/null 2>&1
    echo 'updating neovim plugins..'
    nvim -u ~/.config/nvim/init.vim '+PlugInstall' '+qa!' > /dev/null 2>&1
    nvim -u ~/.config/nvim/init.vim '+PlugUpgrade' '+qa!' > /dev/null 2>&1

    echo 'updating coc.vim..'
    # from https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#update-extensions
    nvim -c 'CocUpdateSync|q'

    #TODO - docker image/container clean up

    #TODO - npm global packages install/update

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
            sudo apt autoremove --yes
        case Darwin
            echo 'Updating macos things..'
            # TODO: xcode update?
            # xcode-select --install
            echo 'Looks like you havent done anything here?'
        case '*'
            echo 'Which os are you?'
    end
end
