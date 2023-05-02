" use vim-plug as plugin manager (for simplicity migrating from vim to neovim)
call plug#begin()

" basic
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	" fzf itself
Plug 'junegunn/fzf.vim' " fuzzy search integration

" syntax / theming / ui
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

call plug#end()

" force 256 colors even if terminal advertises other number (eg. tmux)
set t_Co=256

" leader key
map <space> <leader>

" colors
syntax enable
colorscheme gruvbox

" indendation and tabs
set tabstop=4       " default number of spaces that a <Tab> in the file counts for
set shiftwidth=4    " default number of spaces to use for each indent

" au FileType py set cinwords=if,elif,else,for,while,try,except,finally,def,class " add python-specific keywords
autocmd FileType python setlocal et ts=4 sw=4
autocmd FileType html,css setlocal et ts=2 sw=2
autocmd FileType htmldjango setlocal et ts=2 sw=2
autocmd FileType yaml setlocal et ts=2 sw=2
autocmd FileType sh setlocal noet ts=4 sw=4

" misc
autocmd BufWritePre * %s/\s\+$//e   " remove trailing whitespaces when writing any file

" case sensitivity
set ignorecase " search ignoring case
set smartcase " search ignoring case unless using some uppercase letter
set infercase " use case when autocompleting

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 1
set conceallevel=2

" fuzzy file finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" use clipboard always, using tmux automatically
" https://neovim.io/doc/user/provider.html#provider-clipboard
set clipboard+=unnamedplus
