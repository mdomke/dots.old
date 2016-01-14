
let g:pymode_motion = 1

let g:pymode_options_max_line_length = 100
let g:pymode_lint_ignore = "C0111"
" let g:pymode_lint_checkers = ['flake8']
nnoremap ,pl :PymodeLintAuto<cr>

let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_rename_bind = '<leader>pr'
let g:pymode_rope_organize_imports_bind = '<leader>po'
let g:pymode_rope_goto_definition_bind = '<leader>pf'

let g:pymode_doc = 0

let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>pb'

