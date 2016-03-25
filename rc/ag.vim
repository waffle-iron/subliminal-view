"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:ag_working_path_mode='r'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" Use Ag over Grep
set grepprg=ag\ --vimgrep

" Open Ag and put the cursor in the right position

nmap <silent> <leader>f :Ag!<SPACE>

imap <silent> <leader>f <ESC>:Ag!<SPACE>

vmap <silent> <leader>f :call VisualSelection('f', '')<CR>

vmap <silent> <leader>b :call VisualSelection('b', '')<CR>

" When you press gv you Ag after the selected text
vmap <silent> <leader>gf :call VisualSelection('gv', '')<CR>

" When you press <leader>r you can search and replace the selected text
vmap <silent> <leader>h :call VisualSelection('replace', '')<CR>

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

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag! \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

