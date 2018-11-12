" enable syntax highlighting
syntax on

" detect filetype and load plugin and indentation files if they exist
filetype plugin indent on

" expand tabs to spaces
set expandtab

" paste mode, so we can paste text from other windows
set paste

" show line and col number of the cursor position
set ruler

" remove trailing whitespaces on some file extensions
autocmd FileType markdown,php,bash,javascript autocmd BufWritePre <buffer> %s/\s\+$//e
