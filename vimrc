" http://gergap.wordpress.com/2009/05/29/minimal-vimrc-for-cc-developers/
" disable vi compatibility (emulation of old bugs)
set nocompatible " be iMproved
filetype off " required by vundle

"""""" INDENTATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 100 chars. 80 is somewaht antiquated with nowadays displays.
" set textwidth=100

"""""" SYNTAX HIGHLIGHT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" turn syntax highlighting on
set t_Co=256
syntax on
" on installation of my dotfiles this scheme does not exist, avoid error msg!
silent! colorscheme wombat256mod
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

""""" SEARCH RESULT HIGHLIGHT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hls
" Set a shortcut to mute highlight until next search (Practical Vim, tip 80)
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"""""" SEARCH WITH ACK
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=ack\ --ignore-file=is:tags\ --ignore-dir=Release\ --ignore-dir=Debug\ --no-group\ --column\ $*
set grepformat=%f:%l:%c:%m

"""""" ENCODING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" output encoding shown in the terminal latin1 (used in most projects)
"set encoding=latin1
" output encoding of the file that is written
set fileencoding=latin1

"""""" KEY MAPPING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key remapping to accomodate my spanish keyboard.
nnoremap ñ l
nnoremap l k
nnoremap k j
nnoremap j h

vnoremap ñ l
vnoremap l k
vnoremap k j
vnoremap j h

nnoremap <C-w>ñ <C-w>l
nnoremap <C-w>l <C-w>k
nnoremap <C-w>k <C-w>j
nnoremap <C-w>j <C-w>h

" To enable/disable paste (allows to paste into vim buffer avoding autotabs).
set pastetoggle=<F2>

nnoremap <f5> :!ctags -R --exclude=.git --exclude=CVS --languages=c++,c --c++-kinds=+p --fields=+iaS --extra=+q<CR>

"""""" TAGBAR
nmap <F8> :TagbarToggle<CR>

"""""" CTRL-P
set wildignore+=*/Debug/*,*/Release/*

"""""" PYTHON
autocmd FileType python set omnifunc=pythoncomplete#Complete

"""""" OTHERS
if has("statusline")
    set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

" Line numbers
set number

"""""" VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles
" original repos on github
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'

" vim-scripts repos
Bundle 'a.vim'
Bundle 'ack.vim'
Bundle 'wombat256.vim'


filetype plugin indent on " required!

