set wrapscan
set number

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'

filetype on

syntax enable
colorscheme aqua
filetype plugin indent on
