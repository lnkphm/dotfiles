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
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'

        " Syntax highlighting
        Plug 'sheerun/vim-polyglot'

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
    set signcolumn=yes

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
    " NerdTree
    map <C-o> :NERDTreeToggle<CR>

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
    let g:deoplete#enable_at_startup=1
    let g:deoplete#max_list=10
    call deoplete#custom#source('LanguageClient', 'max_abbr_width', 0)
    call deoplete#custom#source('LanguageClient', 'max_menu_width', 0)

    " Echodoc
    let g:echodoc#enable_at_startup=1
    let g:echodoc#type = 'signature'

    " LanguageClient
    let g:LanguageClient_serverCommands={
        \ 'cpp': ['clangd'],
        \ } 
    
""" }}}





