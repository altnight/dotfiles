" =================================================
" initialize
" =================================================
" initialize for NeoBundle
" mkdir ~/.vim
" git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/neobundle.vim
set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim
endif

call neobundle#rc(expand('~/.vim'))

if $TMUX == ''
    set clipboard+=unnamed
endif

" =================================================
"
" =================================================
syntax on
filetype plugin on
set encoding=utf-8

" set indent to new line
" set autoindent
"
set browsedir=buffer
" use clipboard
" required: vim configure +clipboard
set clipboard=unnamed
" complitation command mode
set nocompatible
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

" escape highlight (command: esc, esc)
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" trip eol whitespace
autocmd BufWritePre * :%s/\s\+$//ge

" move buffer (command: w)
nnoremap <silent><Tab> <C-w>w

" resize buffer (command: > or <)
nnoremap <silent>> <C-w>>
nnoremap <silent>< <C-w><
"
" open tab (command: M)
nnoremap <silent>M :<C-u>:tabnew<CR>
" move tab (command: m)
nnoremap <silent>m :<C-u>:tabnext<CR>
" open current buffer on new tab
nnoremap <silent>,m :<C-u>:tab split<CR>

" whitespace, if input tab
autocmd FileType * set tabstop=2 shiftwidth=2
autocmd FileType javascript set tabstop=2 shiftwidth=2
autocmd FileType html set tabstop=2 shiftwidth=2
autocmd FileType python set tabstop=4 shiftwidth=4
autocmd FileType coffee set tabstop=4 shiftwidth=4
autocmd FileType sass set tabstop=4 shiftwidth=4

" =================================================
" complitation
" =================================================

""""""""""""""""""""
" NeoBundle, plugin manager like pathogen, vundle
""""""""""""""""""""
NeoBundleFetch 'git://github.com/Shougo/neobundle.vim.git'
" install :NeoBundleInstall
nnoremap <silent> ,nbi :<C-u>NeoBundleInstall<CR>
" install & update :NeoBundleInstall!
nnoremap <silent> ,nbI :<C-u>NeoBundleInstall!<CR>
" clean :NeoBundleClean
nnoremap <silent> ,nbc :<C-u>NeoBundleClean<CR>

" TODO: move
" Lua for Mac
if has('mac')
  let $LUA_DLL='/usr/local/lib/liblua.dylib'
endif

""""""""""""""""""""
" neocomplete
""""""""""""""""""""
NeoBundle 'Shougo/neocomplete'
" enable neocomplcacehe
let g:neocomplete#enable_at_startup = 1

" keyword completion
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" dictionary complitation
let g:neocomplete#sources#dictionary#dictionaries = {
   \ 'default' : '',
   \ 'css' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ 'less' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ 'sass' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ }
" omni completion
autocmd FileType css,less,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,htmldjango setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript,coffee setlocal omnifunc=javascriptcomplete#CompleteJS

""""""""""""""""""""
" neosnippet
""""""""""""""""""""
" expand snippet
NeoBundle 'git://github.com/Shougo/neosnippet.git'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" snippet files
let g:neosnippet#snippets_directory='~/dotfiles/vimfiles'

" template
autocmd BufNewFile *.py 0r $HOME/dotfiles/vimfiles/templates.py

""""""""""""""""""""
"
""""""""""""""""""""
" python virtualenv
NeoBundle "git://github.com/jmcantrell/vim-virtualenv.git"

" english
NeoBundle 'https://github.com/ujihisa/neco-look.git'
" TODO: word file or ext settings

" ctags (use :Tlist)
" if using mac, remove default ctags command
NeoBundle 'taglist.vim'
set tags=tags

" zen coding
NeoBundle 'https://github.com/mattn/emmet-vim.git'
let g:user_emmet_expandabbr_key = '<c-e>'

" replace in Quickfix
NeoBundle "git://github.com/thinca/vim-qfreplace.git"
nnoremap <silent>qf :Qfreplace<CR>

" toggle comment (NERDCommenter)
NeoBundle 'git://github.com/scrooloose/nerdcommenter.git'
nmap ,c <Plug>NERDCommenterToggle
vmap ,c <Plug>NERDCommenterToggle

" =================================================
" Syntax
" =================================================
" fix file indent
nnoremap <silent>,in gg=G<CR>

" JavaScript indent (command =G)
NeoBundle 'git://github.com/vim-scripts/JavaScript-Indent.git'

" Markdown
NeoBundle 'git://github.com/tpope/vim-markdown.git'

" reST (ft=rst)
" TODO: if don't use, remove
" NeoBundle 'git://github.com/vim-scripts/rest.vim.git'
autocmd FileType rst setlocal foldmethod=marker

" nginx
NeoBundle 'nginx.vim'
au BufRead,BufNewFile /etc/nginx/* set ft=nginx

""""""""""""""""""""
" syntastic
""""""""""""""""""""
" common syntax
NeoBundle 'git://github.com/scrooloose/syntastic.git'
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['pep8', 'pyflakes']
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['python', 'javascript', 'php'],
                           \ 'passive_filetypes': [] }
" =================================================
" Filer
" =================================================

""""""""""""""""""""
" VimFiler
""""""""""""""""""""
NeoBundle 'git://github.com/Shougo/vimfiler.git'
" don't use default
let g:vimfiler_as_default_explorer = 0
let g:vimfiler_safe_mode_by_default = 0
" start vimfiler ,e
nnoremap <silent>,e :<C-u>VimFilerBufferDir<CR>

""""""""""""""""""""
" Unite
""""""""""""""""""""
NeoBundle 'git://github.com/Shougo/unite.vim.git'
" if display .file, input "."
" start input mode
" let g:unite_enable_start_insert=1
" buffer list
nnoremap <silent> fb :<C-u>Unite buffer -start-insert<CR>
" file list
nnoremap <silent> ff :<C-u>UniteWithBufferDir -buffer-name=dotfiles file<CR>
" recent file list
nnoremap <silent> fm :<C-u>Unite file_mru -start-insert<CR>
" like ctrips
nnoremap <silent> fa :<C-u>execute
      \ 'Unite'
      \ '-start-insert'
      \ 'buffer file_mru'
      \ 'file:'.fnameescape(expand('%:p:h'))
      \ 'file_rec:!:'.fnameescape(expand('%:p:h'))
      \ <CR>

" unite grep
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" unite grep(current cursor word)
"nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" call result recent unite grep word
"nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" use ag(The Silver Searcher), if unite grep
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

NeoBundle 'https://github.com/Shougo/neomru.vim'

" Ag.vim
" install mac: brew install the_silver_searcher
" install ubuntu: https://github.com/ggreer/the_silver_searcher から build
" :Ag [options] {patterns} [{directory}]
NeoBundle 'git://github.com/rking/ag.vim.git'
let g:agprg="ag --nocolor --nogroup --column"

" cd this buffer
nnoremap <silent> cd :cd %:h<CR>

" :Calender
NeoBundle 'git://github.com/mattn/calendar-vim.git'

" =================================================
" others
" =================================================
" asynchronous
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" share other vims
NeoBundle 'yanktmp.vim'
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" quick run(command \r)
NeoBundle 'git://github.com/thinca/vim-quickrun.git'

" make tmp file (command :JunkfileOpen)
NeoBundle 'git://github.com/Shougo/junkfile.vim.git'
" let g:junkfile#directory=path/to/local/.vim_junk"

" =================================================
" colorscheme
" =================================================
" molokai
NeoBundle 'tomasr/molokai'
" pyte
NeoBundle 'therubymug/vim-pyte'
" solarized
NeoBundle 'altercation/vim-colors-solarized'
" zenburn
NeoBundle 'vim-scripts/Zenburn'
" :Unite colorscheme -auto-preview
NeoBundle 'ujihisa/unite-colorscheme'

" 256 colors
set t_Co=256
" molocak, pyte, peachpuff
" colorscheme molokai, pyte, peachpuff, hybrid-light
" configure in .vimrc.local

" status line
NeoBundle 'bling/vim-airline'
NeoBundle 'itchyny/landscape.vim'
let g:airline_theme="landscape"
" display status line default
set laststatus=2

" highlight current line
set cursorline
" under line
"autocmd VimEnter,ColorScheme * : highlight CursorLine cterm=underline ctermbg=234

filetype plugin indent on

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
