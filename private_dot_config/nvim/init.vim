" Basic config

set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set relativenumber
set number
set termguicolors
set title
set list
set listchars=tab:▸\ ,trail:·


" Plugin like things:

" run chezmoi apply on dotfile save
autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"
