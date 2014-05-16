" let g:lightline = {
"       \ 'colorscheme': 'solarized',
"       \ 'component': {
"       \   'readonly': '%{&readonly?"⭤":""}',
"       \ },
"       \ 'separator': { 'left': '', 'right': '' },
"       \ 'subseparator': { 'left': '|', 'right': '|' }
"       \ }
      " \ 'separator': { 'left': '⮀', 'right': '⮂' },
      " \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      "
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
