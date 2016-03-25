" File explorer (left panel) -------------------------------------------------
" Make nerdtree look nice
let NERDTreeMinimalUI = 1

" Always open at startup
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_gui_startup=1

" Toggle NERDTree
noremap <silent> <C-g> :NERDTreeTabsToggle<CR>

" let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
" let NERDTreeChDirMode=0
" let NERDTreeQuitOnOpen=1
" let NERDTreeMouseMode=2
" let NERDTreeShowHidden=1
" let NERDTreeKeepTreeInNewTab=1

