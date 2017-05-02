" Jonny Balls Vim settings

set wrapscan "Searching wraps back around to the beginning
set number
set nocompatible
set expandtab
set softtabstop=4
set shiftwidth=4

filetype off
call plug#begin('~/.vim/plugged') " Set directory for plugins

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Language plugins
Plug 'cakebaker/scss-syntax.vim'
Plug 'rust-lang/rust.vim'
Plug 'digitaltoad/vim-pug'
Plug 'mattn/emmet-vim'


call plug#end()
filetype on

" NerdTree mappings
map <C-n> :NERDTreeToggle<CR>

" Airline symbols
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set encoding=utf-8
let g:airline_left_sep = '▙'
let g:airline_right_sep = '▟'

" CtrlP shortcut mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

syntax enable
filetype on
filetype plugin indent on

" Escape with jj
:imap jj <Esc>

" Set colorscheme
"colorscheme molokai_dark
let g:airline_theme='badwolf'

" Full colors
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Make comments italic
highlight Comment cterm=italic

