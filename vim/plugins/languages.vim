" Syntax 
" Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake'
Plug 'valloric/youcompleteme', { 'for': ['python', 'c', 'cpp', 'go', 'rust'], 'do': './install.py --clang-completer --gocode-completer --racer-completer' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" HTML/CSS/LESS
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'skwp/vim-html-escape', { 'for': 'html' }
Plug 'mattn/emmet-vim', { 'for': 'html'}

" JavaScript/CoffeScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript'}
Plug 'itspriddle/vim-jquery', { 'for': 'javascript'}
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee'}

" Other
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'jtratner/vim-flavored-markdown'

" Python
Plug 'klen/python-mode', { 'for': 'python', 'branch': 'develop' }
