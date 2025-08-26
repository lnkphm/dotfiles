""" Plugins

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'nanotech/jellybeans.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'raimondi/delimitmate'
    Plug 'tpope/vim-commentary'
call plug#end()


""" Settings

" General
set nocompatible
filetype plugin indent on
syntax on
set encoding=utf-8
set clipboard=unnamedplus
set hidden
set ttyfast
set lazyredraw
set confirm
set noautowrite
set splitbelow
set splitright

" Display
set background=dark
silent! colorscheme jellybeans
set number
set numberwidth=5
set title
set noshowmode
set nowrap
set scrolloff=5
set laststatus=2

" Indent
set autoindent
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
set smarttab
set backspace=indent,eol,start


""" Keymaps

let mapleader = " "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>


""" Plugin Settings

" Lightline
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ }

" Indentline
let g:indentLine_char = '│'
