" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" Use Ag over Grep
set grepprg=ag\ --nogroup\ --nocolor


"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Ag searching and cope displaying
" "    requires ag.vim - it's much better than vimgrep/grep
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " When you press gv you Ag after the selected text
" vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
"
" " Open Ag and put the cursor in the right position
" map <leader>g :Ag
"
" " When you press <leader>r you can search and replace the selected text
" vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
"
" " Do :help cope if you are unsure what cope is. It's super useful!
" "
" " When you search with Ag, display your results in cope by doing:
" "   <leader>cc
" "
" " To go to the next search result do:
" "   <leader>n
" "
" " To go to the previous search results do:
" "   <leader>p
" "
" map <leader>cc :botright cope<cr>
" map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>
"
