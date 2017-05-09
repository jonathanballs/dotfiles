" Jonny Balls Vim settings

set wrapscan "Searching wraps back around to the beginning
set number
set nocompatible
set expandtab
set softtabstop=4
set shiftwidth=4

filetype off
call plug#begin('~/.vim/plugged') " Set directory for plugins

" Normal plugins
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Language plugins
Plug 'cakebaker/scss-syntax.vim'
Plug 'rust-lang/rust.vim'
Plug 'digitaltoad/vim-pug'
Plug 'mattn/emmet-vim'
Plug 'landaire/deoplete-d'


call plug#end()
filetype on

" NerdTree mappings
map <C-n> :NERDTreeToggle<CR>

" Enable deoplete completions
call deoplete#enable()
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

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
let g:airline_theme='solarized'

" Full colors
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Make comments italic
highlight Comment cterm=italic

" Mark where lines go over 80 chars
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Remove trailing whitespace
map <C-i> :%s/\s\+$//e<CR>

