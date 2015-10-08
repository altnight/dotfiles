" =================================================
" initialize
" =================================================
" initialize NeoBundle
" see https://github.com/Shougo/neobundle.vim
"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('$HOME/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here ---------------
" toggle comment (NERDCommenter)
NeoBundle 'scrooloose/nerdcommenter'
" asynchronous
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/neocomplete'
NeoBundle 'majutsushi/tagbar'
" english
NeoBundle 'ujihisa/neco-look'
" zen coding
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
" molokai
NeoBundle 'tomasr/molokai'
" status line
NeoBundle 'bling/vim-airline'
NeoBundle 'itchyny/landscape.vim'
" quick run(command \r)
NeoBundle 'thinca/vim-quickrun'
" make tmp file (command :JunkfileOpen)
NeoBundle 'Shougo/junkfile.vim'
" VimFiler
NeoBundle 'Shougo/vimfiler'
" syntax
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tell-k/vim-autopep8.git'

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

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
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
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
"
if $TMUX == ''
    set clipboard+=unnamed
endif

" =================================================
" map, alias
" =================================================
" move buffer (command: w)
nnoremap <silent><Tab> <C-w>w
" resize buffer (command: > or <)
nnoremap <silent>> <C-w>>
nnoremap <silent>< <C-w><
" open tab (command: M)
nnoremap <silent>M :<C-u>:tabnew<CR>
" move tab (command: m)
nnoremap <silent>m :<C-u>:tabnext<CR>
" open current buffer on new tab
nnoremap <silent>,m :<C-u>:tab split<CR>
" cd this buffer
nnoremap <silent> cd :cd %:h<CR>
" escape highlight (command: esc, esc)
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" reopen .vimrc
nnoremap <silent> ,oo :e $MYVIMRC<CR>
nnoremap <silent> ,os :source $MYVIMRC<CR>

" install
nnoremap <silent> ,nbi :<C-u>NeoBundleInstall<CR>
" install & update
nnoremap <silent> ,nbI :<C-u>NeoBundleInstall!<CR>
" clean
nnoremap <silent> ,nbc :<C-u>NeoBundleClean<CR>
" buffer list
nnoremap <silent> fb :<C-u>Unite buffer<CR>
" file list
nnoremap <silent> ff :<C-u>UniteWithBufferDir -buffer-name=dotfiles file<CR>
" recent file list
nnoremap <silent> fm :<C-u>Unite file_mru<CR>
" like ctrips
nnoremap <silent> fa :<C-u>execute
      \ 'Unite'
      \ '-start-insert'
      \ 'buffer file_mru'
      \ 'file:'.fnameescape(expand('%:p:h'))
      \ 'file_rec:!:'.fnameescape(expand('%:p:h'))
      \ <CR>
nmap ,c <Plug>NERDCommenterToggle
vmap ,c <Plug>NERDCommenterToggle
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
nnoremap <silent>,e :<C-u>VimFilerBufferDir<CR>
nmap <C-l> :TagbarToggle<CR>

" =================================================
" settings
" =================================================
" enable neocomplcacehe
let g:neocomplete#enable_at_startup = 1
" keyword completion
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
" dictionary complitation
let g:neocomplete#sources#dictionary#dictionaries = {
   \ 'default' : '',
   \ 'css' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ 'less' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ 'sass' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ }

let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" snippet files
let g:neosnippet#snippets_directory='~/dotfiles/vimfiles'
" don't use default
let g:vimfiler_as_default_explorer = 0
let g:vimfiler_safe_mode_by_default = 0

let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['pep8', 'pyflakes']
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['python', 'javascript'],
                           \ 'passive_filetypes': [] }

let g:airline_theme="landscape"
let g:user_emmet_expandabbr_key = '<c-e>'
" let g:junkfile#directory=path/to/local/.vim_junk"
" ctags
set tags=tags

let g:tagbar_left = 1
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Headline'
    \ ],
    \ 'sort' : 0,
\ }
let g:tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'ctagsbin' : '/path/to/rst2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
