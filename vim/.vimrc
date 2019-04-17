" global
filetype plugin indent on " detect filetype and load plugin and indentation files if they exist
set encoding=utf-8 " use utf-8 as character encoding used inside vim (buffers, registers, etc.)

" colors
syntax on
colorscheme badwolf

" ui config
set ruler       " show line and col number of the cursor position
set wildmenu    " enhanced command-line completion
set number      " show line numbers
set cursorline  " highlight current line

" Default indendation and tabs
set tabstop=4       " default number of spaces that a <Tab> in the file counts for.
set shiftwidth=4    " default number of spaces to use for each indent
set expandtab       " expand tabs to spaces

" python
au FileType py set cinwords=if,elif,else,for,while,try,except,finally,def,class " add python-specific keywords
au FileType py set autoindent  " copy indent from current line when starting a new line
au FileType py set smartindent " indent after lines starting with for, if,...
au FileType py set textwidth=79 " PEP-8 max line length

" search
set incsearch   " highlight first match as you type your pattern

" plugins
silent! runtime macros/matchit.vim

" misc
autocmd BufWritePre * %s/\s\+$//e   " remove trailing whitespaces when writing any file
