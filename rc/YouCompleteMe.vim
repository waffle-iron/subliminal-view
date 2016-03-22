
"     " YouCompleteMe {
"         if count(g:spf13_bundle_groups, 'youcompleteme')
"             let g:acp_enableAtStartup = 0
"
"             " enable completion from tags
"             let g:ycm_collect_identifiers_from_tags_files = 1
"
"             " remap Ultisnips for compatibility for YCM
"             let g:UltiSnipsExpandTrigger = '<C-j>'
"             let g:UltiSnipsJumpForwardTrigger = '<C-j>'
"             let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
"
"             " Enable omni completion.
"             autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"             autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"             autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"             autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"             autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"             autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"             autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
"
"             " Haskell post write lint and check with ghcmod
"             " $ `cabal install ghcmod` if missing and ensure
"             " ~/.cabal/bin is in your $PATH.
"             if !executable("ghcmod")
"                 autocmd BufWritePost *.hs GhcModCheckAndLintAsync
"             endif
"
"             " For snippet_complete marker.
"             if !exists("g:spf13_no_conceal")
"                 if has('conceal')
"                     set conceallevel=2 concealcursor=i
"                 endif
"             endif
"
"             " Disable the neosnippet preview candidate window
"             " When enabled, there can be too much visual noise
"             " especially when splits are used.
"             set completeopt-=preview
"         endif
"     " }
""     " OmniComplete {
"         " To disable omni complete, add the following to your .vimrc.before.local file:
"         "   let g:spf13_no_omni_complete = 1
"         if !exists('g:spf13_no_omni_complete')
"             if has("autocmd") && exists("+omnifunc")
"                 autocmd Filetype *
"                     \if &omnifunc == "" |
"                     \setlocal omnifunc=syntaxcomplete#Complete |
"                     \endif
"             endif
"
"             hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
"             hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
"             hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE
"
"             " Some convenient mappings
"             "inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
"             if exists('g:spf13_map_cr_omni_complete')
"                 inoremap <expr> <CR>     pumvisible() ? "\<C-y>" : "\<CR>"
"             endif
"             inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"             inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"             inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
"             inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
"
"             " Automatically open and close the popup menu / preview window
"             au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"             set completeopt=menu,preview,longest
"         endif
"     " }
""     " Ctags {
"         set tags=./tags;/,~/.vimtags
"
"         " Make tags placed in .git/tags file available in all levels of a repository
"         let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
"         if gitroot != ''
"             let &tags = &tags . ',' . gitroot . '/.git/tags'
"         endif
"     " }
"


