" Basic settings {{{

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

set clipboard+=unnamed
set clipboard+=autoselect

let $PATH=$HOME."/bin:".$PATH
" }}}

" Plugin settings {{{

" Installing plugins {{{

" Plugin read start
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.dotfiles/vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.dotfiles/vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Color scheme
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'reedes/vim-colors-pencil'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'brendonrapp/smyck-vim'

" Unite
NeoBundle 'Shougo/unite-outline'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'Shougo/unite-help'

" NeoComplete/NeoComlcache
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

" NeoSnipet
NeoBundle 'Shougo/neosnippet'

NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \       'windows' : 'make -f make_mingw32.make',
            \       'cygwin'  : 'make -f make_cygwin.mak',
            \       'mac'     : 'make -f make_mac.mak',
            \       'unix'    : 'make -f make_unix.mak',
            \   },
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
NeoBundle 'claco/jasmine.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'wolf-dog/nighted.vim'

" tools
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tobyS/pdv'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'rizzatti/funcoo.vim'
NeoBundle 'rizzatti/dash.vim'
NeoBundle "thinca/vim-localrc"
NeoBundle 'tyru/caw.vim'
NeoBundle "jceb/vim-hier"
NeoBundle 'bling/vim-airline'
NeoBundle 'sorah/unite-ghq'

" references
NeoBundle 'thinca/vim-ref'
NeoBundle 'slim-template/vim-slim'

" Quickrun
NeoBundle 'thinca/vim-quickrun'

NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'osyo-manga/vim-precious'

" PHP
NeoBundle 'evidens/vim-twig'

" JavaScript
" NeoBundle "jiangmiao/simple-javascript-indenter"
NeoBundle "pangloss/vim-javascript"
NeoBundle "digitaltoad/vim-jade"

" Ruby
NeoBundleLazy 'edsono/vim-matchit', { 
      \ 'autoload' : {
      \   'filetypes': 'ruby',
      \   'mappings' : ['nx', '%']
      \   }
      \ }

NeoBundle 'tpope/vim-rails', { 
      \ 'autoload' : {
      \   'filetypes' : ['haml', 'ruby', 'eruby'] 
      \   }
      \ }

NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}

NeoBundle "vim-ruby/vim-ruby.git"
NeoBundle "tpope/vim-haml"

" C/C++
NeoBundle 'osyo-manga/vim-reunions'


" Plugin reading finish
filetype plugin indent on

" Installation check
NeoBundleCheck
" }}}

" Setting plugins {{{

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
nnoremap <silent>[unite]p         :<C-u>Unite file_rec/async:!<CR>
nnoremap <silent>[unite]ns        :<C-u>Unite neosnippet<CR>

call unite#custom_source('file_rec', 'ignore_pattern', '\%(^\|/\)\.$\|\~$\|\.\%(o\|exe\|dll\|bak\|sw[po]\|class\)$\|\%(^\|/\)\%(\.hg\|\.git\|\.bzr\|\.svn\|\.vagrant\|\.sass-cache\|\.tmp\|.local.\.vimrc\|bower_components\|_secret\|node_modules\|tags\%(-.*\)\?\)\%($\|/\)\|\<target\>')

" unite-outline {{{
nnoremap <silent>[unite]o :<C-u>Unite outline -vertical -no-start-insert<CR>
" }}}

" unite-ghq {{{
nnoremap <silent>[unite]g :<C-u>Unite ghq<CR>
" }}}

" unite-colorscheme {{{
nnoremap [unite]c :<C-u>Unite -auto-preview colorscheme<CR>
" }}}

" unite-help {{{
nnoremap <silent>[unite]hh        :<C-u>UniteWithInput help -vertical<CR>C
" }}}

" }}}

" NeoComplete/NeoComplCache{{{
if neobundle#is_installed('neocomplete')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'

  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
  let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
elseif neobundle#is_installed('neocomplcache')
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_ignore_case = 1
  let g:neocomplcache_enable_smart_case = 1
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns._ = '\h\w*'
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
endif
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

" vim-precious {{{
" filetype=help は insert 時のみ切り替わるように設定
let g:precious_enable_switch_CursorMoved = {
\   "help" : 0
\}

let g:context_filetype#filetypes = {
            \ 'html': [
            \   {
            \    'start':
            \     '<script\%( [^>]*\)\? type="text/javascript"\%( [^>]*\)\?>',
            \    'end': '</script>', 'filetype': 'javascript',
            \   },
            \   {
            \    'start':
            \     '<script\%( [^>]*\)\? type="text/coffeescript"\%( [^>]*\)\?>',
            \    'end': '</script>', 'filetype': 'coffee',
            \   },
            \   {
            \    'start': '<style\%( [^>]*\)\? type="text/css"\%( [^>]*\)\?>',
            \    'end': '</style>', 'filetype': 'css',
            \   },
            \   {
            \    'start': '<?php\?',
            \    'end': '?>', 'filetype': 'php',
            \   }
            \ ],}
" }}}

" quickrun {{{
let g:quickrun_config = {}

let g:quickrun_config._ = {
      \ "outputter" : "error",
      \ "outputter/error/success" : "buffer",
      \ "outputter/error/error"   : "quickfix",
      \ "outputter/buffer/split" : ":botright 8sp",
      \ "outputter/quickfix/open_cmd" : "copen",
      \ "runner" : "vimproc",
      \ "runner/vimproc/updatetime" : 500
      \ }
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked\ 2',
      \ 'exec'      : '%c %o %a %s',
      \ }
map <Leader>qr :QuickRun<CR>
" }}}

" caw.vim {{{
nmap <Leader>ct <Plug>(caw:I:toggle)
vmap <Leader>ct <Plug>(caw:I:toggle)

nmap <Leader>co <Plug>(caw:I:uncomment)
vmap <Leader>co <Plug>(caw:I:uncomment)
" }}}

" neosnippet {{{

" 現在の filetype のスニペットを編集する為のキーマッピング
" こうしておくことでサッと編集や追加などを行うことができる
" 以下の設定では新しいタブでスニペットファイルを開く
nnoremap <Space>ns :execute "tabnew\|:NeoSnippetEdit ".&filetype<CR>

" スニペットファイルの保存ディレクトリを設定
let g:neosnippet#snippets_directory = "~/.vim/bundle/neosnippet-snippets/neosnippets"
" }}}

" Indent Guides {{{
hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=237
" }}}

" vim-airline }}}
let g:airline_section_a = airline#section#create(['mode',''])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
set laststatus=2
" }}} 

" GUI settings {{{

" Font settings {{{
set guifont=Ricty:h14

if has('gui_running')
  set transparency=0
  set visualbell t_vb=
endif
" }}}

" color settings {{{
syntax enable
set t_Co=256
"set background=light
"colorscheme pencil
set background=dark
colorscheme lucius
" }}}

let g:indent_guides_enable_on_vim_startup = 1

" }}}

" Editing settings {{{

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
  autocmd FileType scss       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sass       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType slim       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType eruby      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType jst        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType markdown   setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
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
  autocmd FileType twig       setlocal sw=2 sts=2 ts=2 et
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

set list

highlight NonText cterm=underline ctermfg=darkgrey
highlight SpecialKey cterm=underline ctermfg=darkgrey
set listchars=tab:»-,trail:_,eol:↲,extends:»,precedes:«,nbsp:%

" }}}

" }}}

" Language settings {{{

" HTML5 {{{

" HTML5 Tags {{{ 
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

" C++ {{{

" Include Path
augroup cpp-path
  autocmd!
  autocmd FileType cpp setlocal path=.,/usr/include,/usr/local/include,/opt/local/include
augroup END
" }}}

" Ruby {{{
au BufRead,BufNewFile *.rabl setf ruby
" }}}

function! s:unite_gitignore_source()
  let sources = []
  if filereadable('./.gitignore')
    for file in readfile('./.gitignore')
      if file !~ "^#\\|^\s\*$"
        call add(sources, file)
      endif
    endfor
  endif

  if isdirectory('./.git')
    call add(sources, '.git')
  endif
  let pattern = escape(join(sources, '|'), './|')
  call unite#custom#source('file_rec', 'ignore_pattern', pattern)
  call unite#custom#source('file_rec/async', 'ignore_pattern', pattern)
  call unite#custom#source('file_rec/git', 'ignore_pattern', pattern)
  call unite#custom#source('grep', 'ignore_pattern', pattern)
endfunction
call s:unite_gitignore_source()

" }}}

