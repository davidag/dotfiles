" detect filetype and load plugin and indentation files if they exist
filetype plugin indent on

" enable syntax highlighting
syntax on

" paste mode, so we can paste text from other windows
set paste

" show line and col number of the cursor position
set ruler

" use utf-8 as character encoding used inside vim (buffers, registers, etc.)
set encoding=utf-8

" enhanced command-line completion
set wildmenu

" Indentation
""""""""""""""

" default number of spaces that a <Tab> in the file counts for.
set tabstop=4

" default number of spaces to use for each indent
set shiftwidth=4

" expand tabs to spaces
set expandtab

" copy indent from current line when starting a new line
set autoindent

" Search
"""""""""
" highlight first match as you type your pattern (vanishes as long as you press <Enter>)
set incsearch

" enable matchit plugin (comes installed with vim)
silent! runtime macros/matchit.vim

" remove trailing whitespaces when writing any file
autocmd BufWritePre * %s/\s\+$//e
