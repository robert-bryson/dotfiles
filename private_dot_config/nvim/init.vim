" Basic config

set expandtab
set shiftwidth=4
set hlsearch
set incsearch
set tabstop=4
set hidden
set relativenumber
set number
set termguicolors
set title
set list
set listchars=tab:▸\ ,trail:·
set scrolloff=8
set sidescrolloff=8


" Plugin like things:

" run chezmoi apply on dotfile save
autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal spell textwidth=80
