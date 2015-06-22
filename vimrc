"" yucchiy's vimrc

" Essentials {{{

" set $PATH
let $PATH=$HOME."/bin:".$PATH

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

" use backspace when insert mode
set backspace=indent,eol,start

language message C
language time C

" fold settings
set foldenable
set foldmethod=marker

set ambiwidth=double

" not using local back up
set nobackup

" }}}

" Installing Plugins {{{

" load neobundle.vim
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.dotfiles/vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.dotfiles/vim/bundle/'))

" Install Essential plugins
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \       'windows' : 'make -f make_mingw32.make',
      \       'cygwin'  : 'make -f make_cygwin.mak',
      \       'mac'     : 'make -f make_mac.mak',
      \       'unix'    : 'make -f make_unix.mak',
      \   },
      \ }

" Unite Plugins
NeoBundle 'Shougo/unite.vim', {
      \ 'autoload' : {
      \     'commands' : [{'name': 'Unite', 'complete' : 'customlist,unite#complete_source'},
      \                   'UniteWithBufferDir',
      \                   'UniteWithCursorWord', 'UniteWithInput'],
      \     }
      \ }

NeoBundle 'sorah/unite-ghq'
NeoBundle 'shougo/unite-outline'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'shougo/unite-help'

" Install NeoComplete or NeoComplcache for using AutoComplete
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

" Install additional plugins of NeoComplete
NeoBundle 'm2mdas/phpcomplete-extended'
NeoBundle 'm2mdas/phpcomplete-extended-laravel'

" Filer
NeoBundle "Shougo/vimfiler"

" Syntax
NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'evidens/vim-twig'
NeoBundle 'xsbeats/vim-blade'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'tpope/vim-markdown'
NeoBundle "pangloss/vim-javascript"
NeoBundle "digitaltoad/vim-jade"
NeoBundle 'slim-template/vim-slim'
NeoBundle "vim-ruby/vim-ruby.git"
NeoBundle "tpope/vim-haml"
NeoBundle 'vhdirk/vim-cmake'
NeoBundle 'fatih/vim-go'
NeoBundle 'b4winckler/vim-objc'

" Misc
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'rhysd/accelerated-jk'
NeoBundle 'osyo-manga/vim-precious', { 'depends': 'Shougo/context_filetype.vim' }
NeoBundle "thinca/vim-localrc"
NeoBundle 'tyru/caw.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'itspriddle/vim-marked'
NeoBundle 'Shougo/vimshell.vim'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

NeoBundleLazy 'edsono/vim-matchit', {
      \ 'autoload' : {
      \   'filetypes': 'ruby',
      \   'mappings' : ['%']
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


" Plugin reading finish
filetype plugin indent on

NeoBundleCheck

" }}}

" Plugin Settings {{{

" unite.vim {{{

let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_filename_format = ''
let g:unite_source_file_mru_limit = 100
let g:unite_split_rule = 'rightbelow'
let g:loaded_unite_source_bookmark = 1
let g:loaded_unite_source_tab = 1
let g:loaded_unite_source_window = 1

" Key Mapping
noremap  [unite] <Nop>
map      <Leader>u [unite]

nnoremap [unite]u :<C-u>Unite source<CR>
nnoremap <silent>[unite]g         :<C-u>Unite -no-start-insert grep<CR>
nnoremap <silent>[unite]is        :<C-u>Unite source -vertical<CR> 
nnoremap <silent>[unite]p         :<C-u>Unite file_rec/git<CR>
nnoremap <silent>[unite]ns        :<C-u>Unite neosnippet<CR>
nnoremap <silent>[unite]tb        :<C-u>Unite tab<CR>

nnoremap <silent>[unite]o :<C-u>Unite outline -vertical -no-start-insert<CR>
nnoremap <silent>[unite]g :<C-u>Unite ghq<CR>

" }}}

" NeoComplete/NeoComplCache {{{

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
  let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
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
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns._ = '\h\w*'
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
endif

" }}}

" VimFiler {{{
"
let g:vimfiler_as_default_explorer = 1
map <Leader>fl :VimFiler . -split -simple -winwidth=35 -no-quit<CR>

" }}}

" vim-precious {{{
let g:precious_enable_switch_CursorMoved = {
      \   "help" : 0
      \ }
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

" caw.vim {{{

nmap <leader>ct <plug>(caw:i:toggle)
vmap <leader>ct <plug>(caw:i:toggle)

nmap <leader>co <plug>(caw:i:uncomment)
vmap <leader>co <plug>(caw:i:uncomment)

" }}}

" easymotion.vim {{{

nmap s <Plug>(easymotion-s2)

let g:EasyMotion_do_mapping = 1

nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)

" }}}

" lightline.vim {{{

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" }}}

" indent-guides {{{

let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

" }}}

" }}}

" Editor Settings {{{

" Indent {{{

set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" }}}

" Specify Language Indent Settings {{{
if has("autocmd")
  filetype plugin on
  filetype indent on

  autocmd FileType conf       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=8 sts=8 ts=8 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType ycss       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sass       setlocal sw=2 sts=2 ts=2 et
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
  autocmd FileType sql        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xhtml      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType twig       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType blade      setlocal sw=2 sts=2 ts=2 et

  autocmd BufRead,BufNewFile *.ycss setlocal ft=scss
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
endif 

" }}}

" Searching {{{

set ignorecase
set smartcase
set incsearch
set nowrapscan

" }}}

" UI {{{

set number
set ruler
set hidden
set showmatch
set showcmd
set cursorline
set listchars=tab:»-
set list
set laststatus=2

" text width
set tw=80
set formatoptions+=t
set wrap linebreak nolist

" hyde the right scroll bar
set guioptions-=R

highlight NonText cterm=underline ctermfg=darkgrey
highlight SpecialKey cterm=underline ctermfg=darkgrey

" }}}

" GUI {{{

" Font
syntax enable
if has('gui_running')
  set guifont=Source\ Han\ Code\ JP\ Medium:h12
  set transparency=10
  set t_Co=256

  set background=dark
  colorscheme jelleybeans
end

" }}}

" Other {{{

" turn off auto indent when leaving from insert mode
autocmd InsertLeave * set nopaste
" turn off auto comment insertion after enter
autocmd FileType * set formatoptions-=ro

" accelerated-jk
nmap j <Plug>(accelerated_jk_gj_position)
nmap k <Plug>(accelerated_jk_gk_position)

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" }}}

" }}}
