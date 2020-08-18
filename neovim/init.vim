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

    " Comment
    Plug 'preservim/nerdcommenter'

    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

""" }}}

""" General {{{

    filetype plugin indent on
    set encoding=utf-8
    set clipboard=unnamedplus
    set hidden

    set splitbelow
    set splitright
    set foldmethod=marker
    set confirm
    set noautowrite
    set nobackup
    set nowritebackup

    set autoindent
    set tabstop=8
    set shiftwidth=4
    set softtabstop=4
    set shiftround
    set expandtab
    set smarttab

    set backspace=indent,eol,start

    set shortmess+=c
    set updatetime=300
""" }}}

""" Interface {{{

    set background=dark
    " let g:gruvbox_contrast_dark='hard'
    syntax enable
    colorscheme jellybeans

    set number              " Show line number
    set numberwidth=5       " Line number width
    set title               " Show filename on title
    set noshowmode          " Hide mode
    set nowrap              " No wrap line
    set laststatus=2        " Always show status line
    set scrolloff=5         " Number of lines after cursor
    set signcolumn=yes

""" }}}

""" Key binddings {{{

    " Leader
    let mapleader = " "

    " Navigation
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l

    " Terminal
    tnoremap <Esc> <C-\><C-n>
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif
    function! OpenTerminal()
        split term://bash
        resize 5
    endfunction
    nnoremap <leader>t :call OpenTerminal()<CR>

    " NerdTree
    map <leader>o :NERDTreeToggle<CR>

    " coc.nvim
    " Use tab for trigger completion
    inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <CR> to confirm completion
    if exists('*complete_info')
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " nmap <silent> [g <Plug>(coc-diagnostic-prev)
    " nmap <silent> ]g <Plug>(coc-diagnostic-next)

    nmap <silent> <leader>gd <Plug>(coc-definition)
    nmap <silent> <leader>gy <Plug>(coc-type-definition)
    nmap <silent> <leader>gi <Plug>(coc-implementation)
    nmap <silent> <leader>gr <Plug>(coc-references)

    nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

""" }}}

""" Custom command {{{

    " Auto close NERDTree window
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 

""" }}}

""" Plugin settings {{{

    " Lightline
    let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'cocstatus': 'coc#status'
        \ },
        \ }
    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

    " Indentline
    let g:indentLine_char = '│'

    " NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " Vim-polygot
    let g:cpp_class_scope_highlight = 1
    let g:cpp_member_variable_highlight = 1
    let g:cpp_class_decl_highlight = 1
    let g:cpp_posix_standard = 1

    " NERCCommenter
    let g:NERDSpaceDelims = 1
    let g:NERDDefaultAlign = 'left'
    let g:NERDTrimTrailingWhitespace = 1

""" }}}

