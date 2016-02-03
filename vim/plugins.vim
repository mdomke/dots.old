" ========================================
" Vim plugin configuration
" ========================================

set rtp+=~/.config/nvim/plugins/

call plug#begin('~/.config/nvim/plugged')

runtime appearance.vim
runtime languages.vim
runtime git.vim
runtime textobjects.vim
runtime search.vim
runtime project.vim
runtime vim-improvements.vim

call plug#end()
