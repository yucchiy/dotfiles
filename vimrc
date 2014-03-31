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

set clipboard+=unnamed
set clipboard+=autoselect


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
NeoBundle 'reedes/vim-colors-pencil'
NeoBundle 'jonathanfilip/vim-lucius'

" Unite
NeoBundle 'Shougo/unite-outline'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'Shougo/unite-help'

" neocomplcache.vim
NeoBundle 'Shougo/neocomplcache.vim'

" NeoSnipet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

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
NeoBundle 'cakebaker/scss-syntax.vim'

" tools
NeoBundle 'mhinz/vim-signify'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tobyS/pdv'
NeoBundle 'nathanaelkane/vim-indent-guides'

" references
NeoBundle 'thinca/vim-ref'
NeoBundle 'slim-template/vim-slim'

" Quickrun
NeoBundle 'thinca/vim-quickrun'

NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'osyo-manga/vim-precious'

" PHP
" NeoBundle 'comeonly/php.vim-html-enhanced'

" JavaScript
" NeoBundle "jiangmiao/simple-javascript-indenter"
NeoBundle "pangloss/vim-javascript"

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

NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}

NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}

NeoBundle "thinca/vim-localrc"

" Plugin reading finish
filetype plugin indent on

" Installation check
NeoBundleCheck
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

call unite#custom_source('file_rec', 'ignore_pattern', '\%(^\|/\)\.$\|\~$\|\.\%(o\|exe\|dll\|bak\|sw[po]\|class\)$\|\%(^\|/\)\%(\.hg\|\.git\|\.bzr\|\.svn\|\.vagrant\|\.sass-cache\|\.tmp\|.local.\.vimrc\|bower_components\|_secret\|node_modules\|tags\%(-.*\)\?\)\%($\|/\)\|\<target\>')

" unite-outline {{{
nnoremap <silent>[unite]o :<C-u>Unite outline -vertical -no-start-insert<CR>
" }}}

" unite-colorscheme {{{
nnoremap [unite]c :<C-u>Unite -auto-preview colorscheme<CR>
" }}}

" unite-help {{{
nnoremap <silent>[unite]hh        :<C-u>UniteWithInput help -vertical<CR>C
" }}}

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
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked',
      \ 'exec'      : '%c %o %a %s',
      \ }
map <Leader>qr :QuickRun<CR>
" }}}

" {{{ kobito
function! s:open_kobito(...)
    if a:0 == 0
        call system('open -a Kobito '.expand('%:p'))
    else
        call system('open -a Kobito '.join(a:000, ' '))
    endif
endfunction

" 引数のファイル(複数指定可)を Kobitoで開く
" （引数無しのときはカレントバッファを開く
command! -nargs=* Kobito call s:open_kobito(<f-args>)
" Kobito を閉じる
command! -nargs=0 KobitoClose call system("osascript -e 'tell application \"Kobito\" to quit'")
" Kobito にフォーカスを移す
command! -nargs=0 KobitoFocus call system("osascript -e 'tell application \"Kobito\" to activate'")
" }}}

" color settings  {{{
syntax enable
set t_Co=256
"set background=light
"colorscheme pencil
set background=dark
colorscheme lucius

set list

highlight NonText cterm=underline ctermfg=darkgrey
highlight SpecialKey cterm=underline ctermfg=darkgrey

set listchars=tab:»-,trail:_,eol:↲,extends:»,precedes:«,nbsp:%
" }}}

" Ruby plugin settings {{{

" vim-rails {{{
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings = 1
let g:rails_modelines = 0
" }}}

" unite-rails {{{
function! UniteRailsSetting()
    nnoremap <silent>[unite]rrv  :<C-u>Unite rails/view<CR>
    nnoremap <silent>[unite]rrm  :<C-u>Unite rails/model<CR>
    nnoremap <silent>[unite]rrc  :<C-u>Unite rails/controller<CR>
    nnoremap <silent>[unite]rrs  :<C-u>Unite rails/spec<CR>
    nnoremap <silent>[unite]rrd  :<C-u>Unite rails/db -input=migrate<CR>
    nnoremap <silent>[unite]rrr  :<C-u>Unite rails/rake<CR>
endfunction
aug MyAutCmd
    au User Rails call UniteRailsSetting()
aug END
" }}}

" }}}

" Neo Snippets {{{

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" }}}

" GUI settings {{{
set guifont=Ricty:h15

if has('gui_running')
  set transparency=10
endif
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

" reference settings {{{
if neobundle#is_installed('vim-ref')
  let g:ref_phpmanual_path = $HOME . "/.dotfiles/vim/references/phpmanual"

  " カーソル上の単語でリファレンスを検索する
  autocmd FileType php nnoremap <silent> <C-k> :execute 'Ref phpmanual ' . expand('<cword>') <CR>
endif

" }}}

" mruby {{{
autocmd BufNewFile,BufRead *.mrb set filetype=ruby

" }}}

" }}}
