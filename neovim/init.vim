""" Plugin manager {{{

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" }}}

""" Plugins {{{

call plug#begin('~/.local/share/nvim/plugged')

    " Colorscheme
    Plug 'nanotech/jellybeans.vim'
    Plug 'chriskempson/base16-vim'
    Plug 'tomasr/molokai' 

    " Statusline
    Plug 'itchyny/lightline.vim'

    " File browser
    Plug 'scrooloose/nerdtree'

    " Fuzzy find
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

    " Highlight indent
    Plug 'Yggdroot/indentLine'

call plug#end()

""" }}}

""" Interface {{{

    set background=dark
    silent! colorscheme jellybeans

    " set cursorline          " Highline line
    set number              " Show line number
    set numberwidth=5       " Line number width
    set title               " Show filename on title
    set noshowmode          " Hide mode
    set nowrap              " No wrap line
    set laststatus=2        " Always show statusline
    set scrolloff=5         " Line after cursor

""" }}}

""" General settings {{{

    filetype plugin indent on
    syntax on
    set encoding=utf-8
    set clipboard=unnamedplus
    set hidden

    set splitbelow
    set splitright
    set foldmethod=marker
    set confirm
    set noautowrite

    set autoindent
    set tabstop=8
    set shiftwidth=4
    set softtabstop=4
    set shiftround
    set expandtab
    set smarttab

    set backspace=indent,eol,start

""" }}}

""" Key binddings {{{

    " Leader
    let mapleader = " "

    " NerdTree
    map <leader>o :NERDTreeToggle<CR>

""" }}}

""" Custom command {{{

    " Auto close NERDTree window
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 

""" }}}

""" Plugin settings {{{

    " Lightline
    let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ }

    " Indentline
    let g:indentLine_char = '│'
    
""" }}}

