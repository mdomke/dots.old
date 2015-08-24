
let g:pymode_lint_ignore = "C0111"
let g:pymode_rope_completion = 0
let g:pymode_options_max_line_length = 100

let g:pymode_rope_rename_bind = '<leader>pr'
let g:pymode_rope_organize_imports_bind = '<leader>po'
let g:pymode_rope_goto_definition_bind = '<leader>pf'

let g:pymode_doc = 0

" let g:pymode_options_max_line_length = 80

" nnoremap ,pr :call pymode#rope#rename()<CR>
" nnoremap ,pd :call pymode#rope#show_doc()<CR>
" nnoremap ,pf :call pymode#rope#find_it()<CR>
" nnoremap ,po :call pymode#rope#organize_imports()<CR>
" nnoremap ,pb :call pymode#breakpoint#operate(line('.'))<CR>
