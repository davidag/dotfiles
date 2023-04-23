set nocompatible
filetype off

" use vim-plug as plugin manager
call plug#begin('~/.vim/plugged')
" basic
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/taglist.vim'
" syntax / theming / ui
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'plasticboy/vim-markdown'
call plug#end()

filetype plugin indent on

" force 256 colors even if terminal advertises other number (eg. tmux)
set t_Co=256

" leader key
map <space> <leader>

" colors
syntax enable
colorscheme gruvbox
set background=dark

" indendation and tabs
set tabstop=4       " default number of spaces that a <Tab> in the file counts for
set shiftwidth=4    " default number of spaces to use for each indent
set autoindent      " copy indentantion from current line when starting a new line

" au FileType py set cinwords=if,elif,else,for,while,try,except,finally,def,class " add python-specific keywords
autocmd FileType python setlocal et ts=4 sw=4
autocmd FileType html,css setlocal et ts=2 sw=2
autocmd FileType htmldjango setlocal et ts=2 sw=2
autocmd FileType yaml setlocal et ts=2 sw=2
autocmd FileType sh setlocal noet ts=4 sw=4

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

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 1
set conceallevel=2

" fuzzy file finder
nnoremap <C-P> :Files<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" nvim-specific
if has('nvim')
	" use clipboard always, using tmux automatically
	" https://neovim.io/doc/user/provider.html#provider-clipboard
	set clipboard+=unnamedplus
endif
