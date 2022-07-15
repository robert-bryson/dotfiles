"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


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
source ~/.config/nvim/plugins/airblade-vim-gitgutter.vim
source ~/.config/nvim/plugins/ap-vim-css-color.vim
source ~/.config/nvim/plugins/chr4-nginx.vim
source ~/.config/nvim/plugins/dag-vim-fish.vim
source ~/.config/nvim/plugins/hashivim-vim-terraform.vim
source ~/.config/nvim/plugins/itchyny-lightline.vim
source ~/.config/nvim/plugins/neoclide-coc.vim
source ~/.config/nvim/plugins/rust-lang-rust.vim
source ~/.config/nvim/plugins/tpope-vim-commentary.vim
source ~/.config/nvim/plugins/tpope-vim-fugitive.vim
source ~/.config/nvim/plugins/tpope-vim-surround.vim

" themes
source ~/.config/nvim/themes/shatur/neovim-ayu.vim
source ~/.config/nvim/themes/joshdick/onedark.vim

call plug#end()


syntax on
" set current theme
colorscheme ayu-mirage
"colorscheme onedark




"
" Basic config
"

" inserts spaces instead of tab chars on tab key press
set expandtab
" columns of whitespace for a level of indentation
set shiftwidth=4
" tabs == 4 columns of whitespace
set tabstop=4
" highlights search matches
set hlsearch
" incremental search, jumps to first search match
set incsearch
" hides buffers instead of closing when opening new ones
set hidden
" shows relative numbers
set relativenumber
" with relativenumber, shows both current line and relative numbers
set number
" use colorscheme/gui colors
set termguicolors
" window title == vim 'titlestring', probably filename
set title

" shows trailing listchars
set list
set listchars=tab:▸\ ,trail:·

" force show x lines above/below/sides of cursor
set scrolloff=12
set sidescrolloff=8

" turns off text wrapping
set nowrap
set formatoptions-=t

 " turns off visual bell and bell sounds
set belloff=all

" no swap files. undos in dir
set noswapfile
set undodir=~/.vim/undodir
set undofile


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
" Some good vimrc links
"

" https://github.com/jessarcher/dotfiles/blob/master/nvim/init.vim
