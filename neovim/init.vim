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
    let g:gruvbox_contrast_dark='hard'

    Plug 'nanotech/jellybeans.vim'
    Plug 'chriskempson/base16-vim'
    Plug 'tomasr/molokai' 
    Plug 'morhetz/gruvbox'

    " Statusline
    Plug 'itchyny/lightline.vim'

    " File browser
    Plug 'scrooloose/nerdtree'

    " Fuzzy find
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

    " Highlight indent
    Plug 'Yggdroot/indentLine'

    " Highlight syntax
    Plug 'sheerun/vim-polyglot'

    " Autoclose brackets
    Plug 'raimondi/delimitmate'

    " Auto Complete
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif

    " Show function parameters
    Plug 'Shougo/echodoc.vim'

    " Language Server
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }

call plug#end()

""" }}}

""" Interface {{{

    set background=dark
    silent! colorscheme gruvbox

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

    " Vim-polygot
    " C++
    let g:cpp_class_scope_highlight = 1
    let g:cpp_member_variable_highlight = 1
    let g:cpp_class_decl_highlight = 1
    let g:cpp_posix_standard = 1

    " Deoplete
    let g:deoplete#enable_at_startup = 1

    " Echodoc
    let g:echodoc#enable_at_startup = 1
    let g:echodoc#type = 'signature'

    " LanguageClient
    let g:LanguageClient_serverCommands = {
        \ 'python': ['/usr/local/bin/pyls'],
        \ 'cpp': ['clangd'],
        \ 'c': ['clangd'],
        \ }
    set completefunc=LanguageClient#complete

    function SetLSPShortcuts()
        nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
        nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
        nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
        nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
        nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
        nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
        nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
        nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
        nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
        nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
    endfunction()

    augroup LSP
        autocmd!
        autocmd FileType cpp,c call SetLSPShortcuts()
    augroup END
    
""" }}}

