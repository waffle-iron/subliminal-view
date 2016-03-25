" bundle/ag.vim
" -----------------------------------------

" Ag should search only on project root
let g:ag_working_path_mode='r'

" Use Ag over Grep
set grepprg=ag\ --vimgrep

" Call Ag to search for term in project
nnoremap <silent> <leader>f :call SearchProject()<CR>

" Search for selected term in whole project using Ag
vnoremap <silent> <leader>gf :call VSearchProject()<CR>

" Search for selected term in file (forwards)
vnoremap <silent> <leader>f :call VSearchFile('f')<CR>

" Search for selected term in file (backwards)
vnoremap <silent> <leader>b :call VSearchFile('b')<CR>

" Replace selected term with another inside file
vnoremap <silent> <leader>h :call VSearchReplaceFile()<CR>



" bundle/auto-pairs
" -----------------------------------------


" bundle/conflict-marker.vim
" -----------------------------------------


" bundle/ctrlp.vim
" -----------------------------------------


" bundle/emmet-vim
" -----------------------------------------


" bundle/gitv
" -----------------------------------------


" bundle/goyo.vim
" -----------------------------------------


" bundle/incsearch.vim
" -----------------------------------------


" bundle/indentLine
" -----------------------------------------


" bundle/nerdtree
" -----------------------------------------


" bundle/syntastic
" -----------------------------------------


" bundle/tabular
" -----------------------------------------


" bundle/tagbar
" -----------------------------------------


" bundle/tcomment_vim
" -----------------------------------------


" bundle/ultisnips
" -----------------------------------------


" bundle/undotree
" -----------------------------------------


" bundle/vim-airline
" -----------------------------------------


" bundle/vim-airline-themes
" -----------------------------------------


" bundle/vim-devicons
" -----------------------------------------


" bundle/vim-easygrep
" -----------------------------------------


" bundle/vim-easymotion
" -----------------------------------------


" bundle/vim-easytags
" -----------------------------------------


" bundle/vim-expand-region
" -----------------------------------------


" bundle/vim-fugitive
" -----------------------------------------


" bundle/vim-gitgutter
" -----------------------------------------


" bundle/vim-monokai
" -----------------------------------------


" bundle/vim-multiple-cursors
" -----------------------------------------


" bundle/vim-nerdtree-tabs
" -----------------------------------------


" bundle/vim-pathogen
" -----------------------------------------


" bundle/vim-polyglot
" -----------------------------------------


" bundle/vimproc.vim
" -----------------------------------------


" bundle/vim-rooter
" -----------------------------------------


" bundle/vimshell.vim
" -----------------------------------------


" bundle/vim-snippets
" -----------------------------------------


" bundle/vim-surround
" -----------------------------------------


" bundle/vim-table-mode
" -----------------------------------------


" bundle/vim-textobj-user
" -----------------------------------------


" bundle/YankRing.vim
" -----------------------------------------


" bundle/YouCompleteMe
" -----------------------------------------


