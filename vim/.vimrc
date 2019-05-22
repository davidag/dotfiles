" plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible' " sensible vim defaults
Plug 'alfredodeza/khuno.vim', { 'for': 'python' }
Plug 'vim-scripts/taglist.vim'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
call plug#end()

" leader key
map <space> <leader>

" colors
colorscheme badwolf

" ui config
set number      " show line numbers
set cursorline  " highlight current line

" indendation and tabs
set tabstop=4       " default number of spaces that a <Tab> in the file counts for.
set shiftwidth=4    " default number of spaces to use for each indent
set expandtab       " expand tabs to spaces

" python
au FileType py set cinwords=if,elif,else,for,while,try,except,finally,def,class " add python-specific keywords
au FileType py set smartindent " indent after lines starting with for, if,...
au FileType py set textwidth=79 " PEP-8 max line length

" search
set hlsearch    " highlight matches

" misc
autocmd BufWritePre * %s/\s\+$//e   " remove trailing whitespaces when writing any file

" case sensitivity
set ignorecase " search ignoring case
set smartcase " search ignoring case unless using some uppercase letter
set infercase " use case when autocompleting

" tags
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
map <F7> :TlistToggle<CR>
nnoremap <f5> :!ctags -R<CR>
