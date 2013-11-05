" basic settings {{{

" highlight search result key mapping
nnoremap <c-h><c-l> :set hlsearch! hlsearch?<cr>

" leaderkey
let mapleader=','

" encoding settings
set enc=utf-8
set fenc=utf-8
set fencs=utf-8
set encoding=utf-8

" encoding priority order
set fileencodings=utf-8,sjis,shift-jis,euc-jp,utf-16,ascii,ucs-bom,cp932,iso-2022-jp

" new line formats
set fileformats=unix,dos,mac

set ttyfast
set scrolloff=7
set ttyscroll=3
set lazyredraw

" use backspace when insert mode
set backspace=indent,eol,start

language message C
language time C

set langmenu=none

set foldenable
set foldmethod=marker

set ambiwidth=double

set nobackup

" }}}

" plugins {{{

" Plugin read start
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.dotfiles/vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.dotfiles/vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Color scheme
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'ujihisa/unite-colorscheme'

" Unite
NeoBundle 'Shougo/unite-outline'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'Shougo/unite-help'

" neocomplcache.vim
NeoBundle 'Shougo/neocomplcache.vim'

" NeoSnipet
NeoBundle 'Shougo/neosnippet'

NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \       'windows' : 'echo "Please build vimproc manually."',
            \       'cygwin'  : 'make -f make_cygwin.mak',
            \       'mac'     : 'make -f make_mac.mak',
            \       'unix'    : 'make -f make_unix.mak',
            \   }
            \ }

NeoBundleLazy 'Shougo/unite.vim', {
            \ 'autoload' : {
            \     'commands' : [{'name': 'Unite', 'complete' : 'customlist,unite#complete_source'},
            \                   'UniteWithBufferDir',
            \                   'UniteWithCursorWord', 'UniteWithInput'],
            \     }
            \ }

" syntax
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'kchmck/vim-coffee-script'

" tools
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tobyS/pdv'

" Plugin reading finish
filetype plugin indent on

" Installation check
NeoBundleCheck

" }}}

" plugin settings {{{

" unite.vim {{{

let g:unite_enable_start_insert = 1

let g:unite_source_file_mru_filename_format = ''

let g:unite_source_file_mru_limit = 100

let g:unite_split_rule = 'rightbelow'

let g:loaded_unite_source_bookmark = 1
let g:loaded_unite_source_tab = 1
let g:loaded_unite_source_window = 1

noremap [unite] <Nop>
map     <Leader>u [unite]

nnoremap [unite]u :<C-u>Unite source<CR>
nnoremap <silent>[unite]g         :<C-u>Unite -no-start-insert grep<CR>
nnoremap <silent>[unite]is        :<C-u>Unite source -vertical<CR> 
nnoremap <silent>[unite]p         :<C-u>Unite file_rec:! file/new<CR>

" }}}

" unite-outline {{{

nnoremap <silent>[unite]o :<C-u>Unite outline -vertical -no-start-insert<CR>

" }}}

" unite-colorscheme {{{

nnoremap [unite]c :<C-u>Unite -auto-preview colorscheme<CR>

" }}}

" unite-help {{{

nnoremap <silent>[unite]hh        :<C-u>UniteWithInput help -vertical<CR>C

" }}}

" vim-gitgutter {{{

let g:gitgutter_eager = 0

" }}}

" neocomplcache.vim {{{

let g:acp_enableAtStartup = 0

let g:neocomplcache_enable_at_startup = 1

let g:neocomplcache_enable_smart_case = 1

let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_min_syntax_length = 3

if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif

let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

let g:neocomplcache_max_list = 300
let g:neocomplcache_max_keyword_width = 20

if !exists('g:neocomplcache_delimiter_patterns')
  let g:neocomplcache_delimiter_patterns = {}
endif
let g:neocomplcache_delimiter_patterns.vim = ['#']
let g:neocomplcache_delimiter_patterns.cpp = ['::']

" Enable omni completion.
augroup MyVimrc
  autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
"  autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCss
  autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
  autocmd FileType c          setlocal omnifunc=ccomplete#Complete
  autocmd FileType ruby       setlocal omnifunc=rubycomplete#Complete
augroup END

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c   = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" neocomplcache
let g:neocomplcache_vim_completefuncs = {
      \ 'Unite' : 'unite#complete_source',
      \}
" }}}

" lightline {{{

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2
" }}}

" memolist.vim {{{
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :Unite file:<C-r>=g:memolist_path."/"<CR><CR>
nnoremap <silent>[unite]ml :Unite file:<C-r>=g:memolist_path."/"<CR><CR>
map <Leader>mg  :MemoGrep<CR>                                                                       

let g:memolist_memo_suffix = "markdown"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_prompt_tags = 1 
let g:memolist_vimfiler = 1 

let g:memolist_path = "~/Dropbox/Data/Memolist"
" }}}

" }}}

" editing settings {{{

" indent settings {{{

" http://qiita.com/items/c30367a3af5e418595e9

set autoindent
" auto insert
set smartindent
set expandtab

" how much does tab uses space when display
set tabstop=4
" how much spaces will be inserted when tab is pressed. saame as BS. if it's set to 0, it'll automatically be the same as tabstop
set softtabstop=4
" how much does it change when '>>' or '<<' is pressed
set shiftwidth=4

if has("autocmd")
  filetype plugin on
  filetype indent on
  " when u wanna turn it off
  " autocmd FileType html filetype indent off

  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType conf       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sass       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType eruby      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType jst        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType markdown   setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
endif 


" turn off auto indent when leaving from insert mode
autocmd InsertLeave * set nopaste

" turn off auto comment insertion after enter
autocmd FileType * set formatoptions-=ro

" }}}

" searching settings {{{

" hit Cap letters even when searching with non Cap
set ignorecase

" distinct Cap and none Cap when searching with Cap and none combined
set smartcase

" instant search with enter after the word
set incsearch

" stop at the end of the file
set nowrapscan

" }}}

" showing settings {{{

set number

set cursorline

set showmatch

set hidden

set ruler

set showcmd

set norestorescreen=off

" }}}

" }}}

" color settings  {{{

syntax enable
set t_Co=256
set background=dark
colorscheme base16-eighties

" }}}

" gui settings {{{
set guifont=Ricty:h12

" MacVimでアクティブ時と非アクティブ時の透明度を変える {{{

augroup hack234
  autocmd!
  if has('mac')
    autocmd FocusGained * set transparency=5  " アクティブ時の透過率
    autocmd FocusLost * set transparency=30   " 非アクティブ時の透過率
  endif
augroup END

"}}}

" }}}

" other settings {{{

" html5 {{{
" HTML 5 tags
syn keyword htmlTagName contained article aside audio bb canvas command
syn keyword htmlTagName contained datalist details dialog embed figure
syn keyword htmlTagName contained header hgroup keygen mark meter nav output
syn keyword htmlTagName contained progress time ruby rt rp section time
syn keyword htmlTagName contained source figcaption
syn keyword htmlArg contained autofocus autocomplete placeholder min max
syn keyword htmlArg contained contenteditable contextmenu draggable hidden
syn keyword htmlArg contained itemprop list sandbox subject spellcheck
syn keyword htmlArg contained novalidate seamless pattern formtarget
syn keyword htmlArg contained formaction formenctype formmethod
syn keyword htmlArg contained sizes scoped async reversed sandbox srcdoc
syn keyword htmlArg contained hidden role
syn match   htmlArg "\<\(aria-[\-a-zA-Z0-9_]\+\)=" contained
syn match   htmlArg contained "\s*data-[-a-zA-Z0-9_]\+"
" }}}

" }}}
