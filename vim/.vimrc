" enable syntax highlighting
syntax on

" detect filetype and load plugin and indentation files if they exist
filetype plugin indent on

" paste mode, so we can paste text from other windows
set paste

" show line and col number of the cursor position
set ruler

" use utf-8 as character encoding used inside vim (buffers, registers, etc.)
set encoding=utf-8

" default number of spaces that a <Tab> in the file counts for.
set tabstop=4

" default number of spaces to use for each indent
set shiftwidth=4

" expand tabs to spaces
set expandtab

" copy indent from current line when starting a new line
set autoindent 

" remove trailing whitespaces on some file extensions
autocmd FileType cpp,markdown,php,sh,javascript autocmd BufWritePre <buffer> %s/\s\+$//e
