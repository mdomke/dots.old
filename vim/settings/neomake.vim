function! s:RunNeomake()
  if &ft == 'python'
    " We use pymode to do linting 
    return
  endif
  Neomake
endfunction

autocmd! BufWritePost * call <SID>RunNeomake()


