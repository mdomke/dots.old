" fugitive.git
" ========================================
" For fugitive.git, dp means :diffput. Define dg to mean :diffget
nnoremap <silent> ,dg :diffget<CR>
nnoremap <silent> ,dp :diffput<CR>

nnoremap <silent> ,gs :Gstatus<CR>
nnoremap <silent> ,gc :Gcommit --verbose<CR>
nnoremap <silent> ,gm :Gmerge<CR>
nnoremap <silent> ,gpl :Gpull<CR>
nnoremap <silent> ,gp :Gpush<CR>
nnoremap <silent> ,ga :Gwrite<CR>
