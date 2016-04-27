"" yucchiy's vimrc

" Essentials {{{

" set $PATH
let $PATH=$HOME."/bin:".$PATH

" set GOPATH
let $GOPATH=$HOME

" set path
set path+=/usr/local/include

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
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" Install NeoComplete or NeoComplcache for using AutoComplete
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'


" Language Specify
NeoBundle 'mxw/vim-jsx'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'plasticboy/vim-markdown'
NeoBundleLazy 'jelera/vim-javascript-syntax', {
            \ 'autoload' :  {
            \       'filetypes' : ['javascript']
            \       }
            \ }
NeoBundle 'slim-template/vim-slim'
NeoBundle "vim-ruby/vim-ruby.git"
NeoBundle 'basyura/unite-rails'
NeoBundle 'vhdirk/vim-cmake'
NeoBundle 'fatih/vim-go'
NeoBundle 'vim-jp/vim-go-extra'
NeoBundle 'rust-lang/rust.vim'

" Misc
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
NeoBundle 'tpope/vim-fugitive'

NeoBundle "Shougo/vimfiler"
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle "thinca/vim-localrc"
NeoBundle 'godlygeek/tabular'
NeoBundle 'tyru/caw.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'itspriddle/vim-marked'
NeoBundle 'phildawes/racer'

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


NeoBundleLazy 'OmniSharp/omnisharp-vim', {
            \   'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] },
            \   'build': {
            \     'windows' : 'msbuild server/OmniSharp.sln',
            \     'mac': 'xbuild server/OmniSharp.sln',
            \     'unix': 'xbuild server/OmniSharp.sln',
            \   },
            \ }

NeoBundleLazy 'OrangeT/vim-csharp', { 'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] } }

NeoBundle 'tpope/vim-dispatch'

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

  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'

  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

  " Plugin key-mappings.
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)

  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  if executable('/usr/local/bin/ctags')
    let g:neocomplete#ctags_command = '/usr/local/bin/ctags'
  endif
endif
" }}}

" VimFiler {{{
let g:vimfiler_as_default_explorer = 1
map <Leader>fl :VimFiler . -split -simple -winwidth=35 -no-quit<CR>
" }}}

" caw.vim {{{
nmap <leader>ct <plug>(caw:i:toggle)
vmap <leader>ct <plug>(caw:i:toggle)

nmap <leader>co <plug>(caw:i:uncomment)
vmap <leader>co <plug>(caw:i:uncomment)
" }}}

" go-vim {{{
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
" }}}

" lightline.vim {{{
let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'mode_map': {'c': 'NORMAL'},
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
            \ },
            \ }
" }}}

" incsearch.vim {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" }}}

" vim-go {{{
let g:go_fmt_autosave = 0

let g:go_fmt_command = "goimports"
" }}}

" memolist.vim {{{
let g:memolist_path = "$HOME/src/github.com/yucchiy/note"

let g:memolist_memo_suffix = "markdown"

let g:memolist_memo_date = "%Y-%m-%d %H:%M"

let g:memolist_prompt_tags = 1

let g:memolist_unite = 1
let g:memolist_unite_option = "-auto-preview -start-insert"
let g:memolist_unite_source = "file_rec"

let g:memolist_template_dir_path = "$HOME/src/github.com/yucchiy/note/template"

map <Leader>mn :MemoNew<CR>
map <Leader>ml :MemoList<CR>
map <Leader>mg :MemoGrep<CR>
" }}}

" vim-markdown {{{
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
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
    autocmd FileType c          setlocal sw=2 sts=2 ts=2 et
    autocmd FileType cpp        setlocal sw=2 sts=2 ts=2 et
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
set formatoptions+=t
set wrap linebreak nolist

" hyde the right scroll bar
set guioptions=

highlight NonText cterm=underline ctermfg=darkgrey
highlight SpecialKey cterm=underline ctermfg=darkgrey

" }}}

" GUI {{{

" Font
syntax enable
if has('gui_running')
    set guifont=Ricty\ Regular:h14
    set t_Co=256
    set colorcolumn=80
    set columns=180
    set lines=45

    set background=dark
    colorscheme lucius
else
    set t_Co=256
    set t_ut=
    set colorcolumn=80

    set background=dark
    colorscheme lucius 
end

" }}}

" Other {{{

" turn off auto indent when leaving from insert mode
autocmd InsertLeave * set nopaste
" turn off auto comment insertion after enter
autocmd FileType * set formatoptions-=ro

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" }}}

" }}}

" Shortcuts Settings {{{

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

nnoremap <Leader>nw :tabnew<CR>
nnoremap <Leader>nx :tabNext<CR>
nnoremap <Leader>pv :tabprevious<CR>

" }}}

