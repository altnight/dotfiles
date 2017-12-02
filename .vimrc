" =================================================
" initialize
" =================================================
" initialize dein.vim
" see https://github.com/Shougo/dein.vim

"dein Scripts-----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

set runtimepath+=~/.dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" zen coding
call dein#add('mattn/emmet-vim')
" color scheme molokai
call dein#add('tomasr/molokai')
" status line
call dein#add('bling/vim-airline')
call dein#add('itchyny/landscape.vim')

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

" =================================================
" general
" =================================================
syntax on
" filetype plugin on
set encoding=utf-8
" set indent to new line
" set autoindent
set browsedir=buffer
" use clipboard
" required: vim configure +clipboard
set clipboard=unnamed
" complitation command mode
set wildmode=longest:full,full
" don't make swapfile
set noswapfile
set nobackup
set nowritebackup
" use soft tab(don't use hard tab)
set expandtab
"
set hidden
" use incsearch
set incsearch
" display unlook char
set list
" display tab(don't display eol)
set listchars=tab:>\
" line number
set number
" highlight closing parenthesis
set showmatch
" devite smartcase in search
set smartcase
" intelligent indent
set smartindent
" intelligent indent
set smarttab
" no stop cursor in startswith, endswith
set whichwrap=b,s,h,l,<,>,[,]
" no loop in search
set nowrapscan
" highlight
set hlsearch
" trip eol whitespace
autocmd BufWritePre * :%s/\s\+$//ge
" whitespace, if input tab
autocmd FileType * set tabstop=2 shiftwidth=2
autocmd FileType javascript set tabstop=2 shiftwidth=2
autocmd FileType html set tabstop=2 shiftwidth=2
autocmd FileType python set tabstop=4 shiftwidth=4
" omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,htmldjango setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" 256 colors
set t_Co=256
" configure in .vimrc.local
colorscheme molokai
" display status line default
set laststatus=2
" highlight current line
set cursorline

" =================================================
" map, alias
" =================================================
" move buffer (command: w)
nnoremap <silent><Tab> <C-w>w
" escape highlight (command: esc, esc)
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" =================================================
" plugin settings
" =================================================

let g:airline_theme="landscape"
let g:user_emmet_expandabbr_key = '<c-e>'
