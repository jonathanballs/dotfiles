set wrapscan
set number

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/

" Set directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'gmarik/vundle'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'

call plug#end()

filetype on

syntax enable
colorscheme aqua
filetype plugin indent on

