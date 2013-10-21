" {{{ basic settings

" highlight search result key mapping
nnoremap <c-h><c-l> :set hlsearch! hlsearch?<cr>

" leaderkey
let mapleader=","

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

set nobackup

" Since GitHub cuts the commit title by 70 :D
augroup FileTypePlugin
  autocmd!
  autocmd FileType gitcommit setlocal textwidth=69
augroup END

" end basic settings }}}


" {{{ plugin settings

" Plugin read start
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.dotfiles/vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.dotfiles/vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Color scheme
NeoBundle 'chriskempson/base16-vim'

" Plugin reading finish
filetype plugin indent on

" Installation check
NeoBundleCheck

" end plugin settings }}}
