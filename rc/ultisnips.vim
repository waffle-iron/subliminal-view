
" function! g:UltiSnips_Complete()
"     call UltiSnips_ExpandSnippet()
"     if g:ulti_expand_res == 0
"         if pumvisible()
"             return "\<C-n>"
"         else
"             call UltiSnips_JumpForwards()
"             if g:ulti_jump_forwards_res == 0
"                return "\<TAB>"
"             endif
"         endif
"     endif
"     return ""
" endfunction
"
" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-e>"
" let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultisnips-snippets"]
"
"






" let g:current_path_for_nerd_init=expand('%:p:h')

" " Ultisnip
" " NOTE: <f1> otherwise it overrides <tab> forever
" let g:UltiSnipsExpandTrigger="<f1>"
" let g:UltiSnipsJumpForwardTrigger="<f1>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:did_UltiSnips_vim_after = 1


