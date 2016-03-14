" File explorer (left panel) ----------------------------------------
" Make nerdtree look nice
autocmd vimenter * NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" Toggle focus cursor on file explorer
noremap <leader>t :NERDTreeFocusToggle<CR>
"noremap <C-r> :NERDTreeToggle<CR>:e<CR>:NERDTreeToggle<CR>
noremap <C-g> :NERDTreeToggle<CR>

" Open sidebar with cmd+k
" map <D-k> :NERDTreeTabsToggle<CR>




" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Nerd Tree
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:NERDTreeWinPos = "right"
" let NERDTreeShowHidden=0
" let NERDTreeIgnore = ['\.pyc$', '__pycache__']
" let g:NERDTreeWinSize=35
" map <leader>nn :NERDTreeToggle<cr>
" map <leader>nb :NERDTreeFromBookmark
" map <leader>nf :NERDTreeFind<cr>
"
"
