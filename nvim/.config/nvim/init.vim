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
Plug 'majutsushi/tagbar'
Plug 'arcticicestudio/nord-vim'
Plug 'chrisbra/Colorizer'

" Language plugins
Plug 'cakebaker/scss-syntax.vim'
Plug 'rust-lang/rust.vim'
Plug 'digitaltoad/vim-pug'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mattn/emmet-vim'
Plug 'https://github.com/mxw/vim-jsx.git'
Plug 'leafgarland/typescript-vim'
Plug 'Rip-Rip/clang_complete'
Plug 'w0rp/ale'
Plug 'chr4/nginx.vim'
Plug 'jakwings/vim-pony'
Plug 'keith/swift.vim'

call plug#end()
filetype on

" path for clang library
let g:clang_library_path = '/usr/lib/libclang.so'
let g:ale_completion_enabled = 1

" Open errors
map <C-x> :lopen<CR>

" NerdTree mappings
map <C-n> :NERDTreeToggle<CR>

" Tags
map <C-t> :TagbarToggle<CR>

" Enable deoplete completions
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#sources#d#dcd_server_autostart = 1
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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

syntax enable
filetype on
filetype plugin indent on

" Escape with jj
:imap jj <Esc>

" Set colorscheme
colorscheme dracula

" Full colors
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Make comments italic
highlight Comment cterm=italic

" Mark where lines go over 80 chars
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" Remove trailing whitespace
map <C-i> :%s/\s\+$//e<CR>

"setlocal foldmethod=syntax

" .ts for typescript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" .qss show as css
au BufReadPost *.qss set syntax=css

" Help for my lazy shift finger :)
:command WQ wq
:command Wq wq
:command W w
:command Q q

