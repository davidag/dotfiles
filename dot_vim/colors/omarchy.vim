" Vim colorscheme generated at startup from Omarchy's active palette.
let s:palette_file = expand('~/.config/omarchy/current/theme/colors.toml')
if !filereadable(s:palette_file)
    finish
endif

let s:colors = {}
for s:line in readfile(s:palette_file)
    let s:match = matchlist(s:line, '^\s*\([a-z0-9_]\+\)\s*=\s*"\(#[0-9A-Fa-f]\{6}\)"')
    if !empty(s:match)
        let s:colors[s:match[1]] = s:match[2]
    endif
endfor

for s:required in ['accent', 'cursor', 'foreground', 'background',
            \ 'selection_foreground', 'selection_background',
            \ 'color0', 'color1', 'color2', 'color3', 'color4', 'color5',
            \ 'color6', 'color7', 'color8']
    if !has_key(s:colors, s:required)
        finish
    endif
endfor

highlight clear
if exists('syntax_on')
    syntax reset
endif

if filereadable(expand('~/.config/omarchy/current/theme/light.mode'))
    set background=light
else
    set background=dark
endif
let g:colors_name = 'omarchy'

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, style) abort
    let l:command = 'highlight ' . a:group
    let l:command .= ' guifg=' . (empty(a:guifg) ? 'NONE' : s:colors[a:guifg])
    let l:command .= ' guibg=' . (empty(a:guibg) ? 'NONE' : s:colors[a:guibg])
    let l:command .= ' ctermfg=' . (a:ctermfg < 0 ? 'NONE' : a:ctermfg)
    let l:command .= ' ctermbg=' . (a:ctermbg < 0 ? 'NONE' : a:ctermbg)
    let l:command .= ' gui=' . a:style . ' cterm=' . a:style
    execute l:command
endfunction

call s:hi('Normal',       'foreground',           'background',           7,  0, 'NONE')
call s:hi('Cursor',       'background',           'cursor',               0,  7, 'NONE')
call s:hi('Visual',       'selection_foreground', 'selection_background', 0,  7, 'NONE')
call s:hi('Comment',      'color8',               '',                     8, -1, 'italic')
call s:hi('Constant',     'color5',               '',                     5, -1, 'NONE')
call s:hi('String',       'color2',               '',                     2, -1, 'NONE')
call s:hi('Identifier',   'color4',               '',                     4, -1, 'NONE')
call s:hi('Function',     'accent',               '',                     4, -1, 'NONE')
call s:hi('Statement',    'color1',               '',                     1, -1, 'NONE')
call s:hi('Operator',     'color6',               '',                     6, -1, 'NONE')
call s:hi('PreProc',      'color6',               '',                     6, -1, 'NONE')
call s:hi('Type',         'color3',               '',                     3, -1, 'NONE')
call s:hi('Special',      'color1',               '',                     1, -1, 'NONE')
call s:hi('Underlined',   'color4',               '',                     4, -1, 'underline')
call s:hi('Error',        'foreground',           'color1',               7,  1, 'bold')
call s:hi('Todo',         'background',           'color3',               0,  3, 'bold')
call s:hi('LineNr',       'color8',               'background',           8,  0, 'NONE')
call s:hi('CursorLine',   '',                     'color0',               -1,  0, 'NONE')
call s:hi('CursorLineNr', 'color3',               'color0',                3,  0, 'bold')
call s:hi('Search',       'background',           'color3',               0,  3, 'NONE')
call s:hi('IncSearch',    'background',           'color1',               0,  1, 'bold')
call s:hi('MatchParen',   'background',           'accent',               0,  4, 'bold')
call s:hi('Directory',    'color4',               '',                     4, -1, 'bold')
call s:hi('Pmenu',        'foreground',           'color0',               7,  0, 'NONE')
call s:hi('PmenuSel',     'selection_foreground', 'selection_background', 0,  7, 'NONE')
call s:hi('StatusLine',   'background',           'accent',               0,  4, 'bold')
call s:hi('StatusLineNC', 'foreground',           'color0',               7,  0, 'NONE')
call s:hi('VertSplit',    'color8',               'background',           8,  0, 'NONE')
call s:hi('DiffAdd',      'color2',               'background',           2,  0, 'NONE')
call s:hi('DiffChange',   'color3',               'background',           3,  0, 'NONE')
call s:hi('DiffDelete',   'color1',               'background',           1,  0, 'NONE')
call s:hi('DiffText',     'background',           'color3',               0,  3, 'bold')

delfunction s:hi
unlet s:palette_file s:colors s:line s:match s:required
