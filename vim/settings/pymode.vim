
let g:pymode_lint_ignore = "C0111"

nnoremap ,pr :call pymode#rope#rename()<CR>
nnoremap ,pd :call pymode#rope#show_doc()<CR>
nnoremap ,pf :call pymode#rope#find_it()<CR>
nnoremap ,po :call pymode#rope#organize_imports()<CR>
nnoremap ,pb :call pymode#breakpoint#operate(line('.'))<CR>
