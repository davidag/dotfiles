set nocompatible
filetype off

" use vim-plug as plugin manager
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible' " sensible vim defaults
Plug 'tpope/vim-surround'
" Plug 'alfredodeza/khuno.vim', { 'for': 'python' }
Plug 'vim-scripts/taglist.vim'
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

filetype plugin indent on

" force 256 colors even if terminal advertises other number (eg. tmux)
set t_Co=256

" leader key
map <space> <leader>

" colors
colorscheme badwolf

" ui config
set cursorline  " highlight current line

" indendation and tabs
set tabstop=4       " default number of spaces that a <Tab> in the file counts for
set shiftwidth=4    " default number of spaces to use for each indent
set expandtab       " expand tabs to spaces
set autoindent      " copy indentantion from current line when starting a new line

" python
au FileType py set cinwords=if,elif,else,for,while,try,except,finally,def,class " add python-specific keywords
au FileType py set smartindent " indent after lines starting with for, if,...
au FileType py set textwidth=79 " PEP-8 max line length

" html/css
au FileType css,html set tabstop=2
au FileType css,html set shiftwidth=2

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
nnoremap <f5> :!ctags -R --exclude=venv<CR>

" fuzzy file finder
nnoremap <C-P> :Files<CR>
