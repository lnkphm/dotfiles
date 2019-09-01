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
        Plug 'tpope/vim-commentary'

        " Indent
        Plug 'yggdroot/indentline'

        " Completion
        if has('nvim')
            Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        else
            Plug 'Shougo/deoplete.nvim'
            Plug 'roxma/nvim-yarp'
            Plug 'roxma/vim-hug-neovim-rpc'
        endif
        Plug 'Shougo/neco-syntax' 
        Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ } 
        Plug 'Shougo/echodoc.vim' 

        " Fuzzy find
        Plug 'junegunn/fzf', {'do': './install --bin'} 
        Plug 'junegunn/fzf.vim'

        " C/C++ highlighting
        Plug 'octol/vim-cpp-enhanced-highlight'

    call plug#end()
""" }}}

""" Interface {{{
    set background=dark
    silent! colorscheme molokai

    set cursorline
    set number
    set numberwidth=5
    set title
    set noshowmode
    set scrolloff=5
    set nowrap
    set laststatus=2

    set guifont=Hack:h9
""" }}}

""" General settings {{{
    filetype plugin indent on
    syntax on
    set encoding=utf-8

    set splitbelow
    set splitright
    set foldmethod=marker
    set confirm
    set noautowrite

    set autoindent
    set tabstop=8
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set smarttab
    set backspace=indent,eol,start
""" }}}

""" Key binddings {{{
    map <C-o> :NERDTreeToggle<CR>
""" }}}

""" Custom command {{{
    command! MakeTags !ctags -R .
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
""" }}}

""" Plugin settings {{{
    " Lightline
    let g:lightline = {
        \ 'colorscheme': 'molokai',
        \ }

    " Indentline
    let g:indentLine_char = '│'

    " Deoplete
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#max_list = 10

    " Echodoc
    let g:echodoc#enable_at_startup = 1

    " LanguageClient
    let g:LanguageClient_serverCommands = {
        \ 'cpp': ['clangd'],
        \ } 
""" }}}





