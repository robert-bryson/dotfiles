"
" Basic config
"

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


"
" Plugin like things:
" 

" run chezmoi apply on dotfile save
autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal spell textwidth=80

" Allow gf to open non-existent files
map gf :edit <cfile><cr>


"
" Actual plugins
"

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

call plug#begin(data_dir . '/plugins')

" source ~/.config/nvim/plugins/abolish.vim

call plug#end()


" 
" Some good vimrc links
"

" https://github.com/jessarcher/dotfiles/blob/master/nvim/init.vim
