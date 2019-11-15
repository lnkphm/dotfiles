""" Plugin manager {{{
call system('mkdir -p ~/.local/share/nvim/site/autoload')
call system('mkdir -p ~/.local/share/nvim/plugged')
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    let g:clone_details = 'https://github.com/junegunn/vim-plug.git ~/.local/share/nvim/plugged/vim-plug'
    silent call system('git clone --depth 1 '. g:clone_details)
    silent !ln -s ~/.local/share/nvim/plugged/vim-plug/plug.vim ~/.local/share/nvim/site/autoload/plug.vim
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

    " Comment
    " Plug 'tpope/vim-commentary'
    Plug 'scrooloose/nerdcommenter'

    " Indent line
    Plug 'yggdroot/indentline'

    " Completion
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'Shougo/echodoc.vim' 
    Plug 'Shougo/neco-syntax' 
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ } 

    " Fuzzy find
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " Syntax highlighting
    Plug 'sheerun/vim-polyglot'

    " Auto-close braket
    Plug 'raimondi/delimitmate'

    " Emmet
    Plug 'mattn/emmet-vim'

call plug#end()
""" }}}

""" Interface {{{

    " Colorscheme
    set background=dark
    colorscheme jellybeans

    set cursorline          " Highline line
    set number              " Show line number
    set numberwidth=5       " Line number width
    set title               " Show filename on title
    set noshowmode          " Hide mode
    set scrolloff=5         " Line after cursor
    set nowrap              " No wrap line
    set laststatus=2        " Always show statusline
    
""" }}}

""" General settings {{{

    " Enable syntax highlight
    filetype plugin indent on
    syntax on

    set encoding=utf-8

    set splitbelow
    set splitright
    set foldmethod=marker
    set confirm
    set noautowrite

    " Indent, Tab
    set autoindent
    set tabstop=8
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set smarttab
    set backspace=indent,eol,start

""" }}}

""" Key binddings {{{
    
    " Leader
    let mapleader = ','

    " NerdTree
    map <leader>o :NERDTreeToggle<CR>

    " LanguageClient
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

""" Custom command {{{
    " Make tagfile (C, C++)
    command! MakeTags !ctags -R .

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

    " Deoplete
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#max_list = 10
    call deoplete#custom#source('LanguageClient', 'max_abbr_width', 0)
    call deoplete#custom#source('LanguageClient', 'max_menu_width', 0)

    " Echodoc
    let g:echodoc#enable_at_startup = 1
    let g:echodoc#type = 'signature'

    " LanguageClient
    let g:LanguageClient_serverCommands={
        \ 'c': ['clangd'],
        \ 'cpp': ['clangd'],
        \ 'javascript': ['javascript-typescript-stdio'],
        \ 'typescript': ['javascript-typescript-stdio'],
        \ 'python': ['/usr/bin/pyls']
        \ } 

    " NERDCommenter
    let g:NERDSpaceDelims = 1

    " Emmet
    let g:user_emmet_install_global = 0
    autocmd FileType html,css EmmetInstall
    let g:user_emmet_leader_key = '<leader>'
    let g:emmet_html5 = 1

    
""" }}}

