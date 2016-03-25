" ----------------------------------------------------------------------------
" SEARCH FUNCTIONS
" ----------------------------------------------------------------------------


" bundle/ag.vim
" -----------------------------------------

" Ag should search only on project root
let g:ag_working_path_mode='r'

" Use Ag over Grep
set grepprg=ag\ --vimgrep

" Call Ag to search for term in project
nnoremap <silent> <leader>pf :call SearchProject()<CR>

" Search for selected term in whole project using Ag
vnoremap <silent> <leader>pv :call VSearchProject()<CR>

" Replace selected term with another inside file
vnoremap <silent> <leader>fr :call VSearchReplaceFile()<CR>

" Search for selected term in file (forwards)
vnoremap <silent> <leader>ff :call VSearchFile('f')<CR>

" Search for selected term in file (backwards)
vnoremap <silent> <leader>fb :call VSearchFile('b')<CR>


" bundle/vim-easygrep
" -----------------------------------------

" <Leader>vv  - Grep for the word under the cursor, match all occurences, like 'g*'
" <Leader>vV  - Grep for the word under the cursor, match whole word, like '*'.
" <Leader>va  - Like vv, but add to existing list.
" <Leader>vA  - Like vV, but add to existing list.
" <Leader>vr  - Perform a global search on the word under the cursor and prompt for a pattern with which to replace it.
" <Leader>vR  - Like vr, but match whole word.

let g:EasyGrepCommand = 1


" bundle/incsearch.vim
" -----------------------------------------

let g:incsearch#consistent_n_direction = 1
let g:incsearch#emacs_like_keymap = 1

map <silent> <C-f> <Plug>(incsearch-forward)
map <silent> <C-b> <Plug>(incsearch-backward)


" bundle/ctrlp.vim
" -----------------------------------------

let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'            " search anything (in files, buffers and MRU files at the same time.)

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

let g:ctrlp_use_caching = 0 " ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_working_path_mode = 'ra'    " search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_switch_buffer = 'et'        " jump to a file if it's open already
let g:ctrlp_clear_cache_on_exit = 0          " speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250                 " number of recently opened files

let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_buftag_types = {
    \ 'go'         : '--language-force=go --golang-types=ftv',
    \ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
    \ 'markdown'   : '--language-force=markdown --markdown-types=hik',
    \ 'objc'       : '--language-force=objc --objc-types=mpci',
    \ 'rc'         : '--language-force=rust --rust-types=fTm'
    \ }


" bundle/auto-pairs
" -----------------------------------------


" bundle/conflict-marker.vim
" -----------------------------------------


" bundle/emmet-vim
" -----------------------------------------


" bundle/gitv
" -----------------------------------------


" bundle/goyo.vim
" -----------------------------------------

nnoremap <silent> <leader>z :Goyo<CR>

" bundle/indentLine
" -----------------------------------------

let g:indentLine_color_term = 239

" bundle/nerdtree
" -----------------------------------------

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
let NERDTreeShowHidden=1
" let NERDTreeKeepTreeInNewTab=1


" bundle/syntastic
" -----------------------------------------

" Syntax highlighting --------------------------------------------------------

" mark syntax errors with :signs
let g:syntastic_enable_signs = 1

" automatically jump to the error when saving the file
let g:syntastic_auto_jump = 0

" show the error list automatically
let g:syntastic_auto_loc_list = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']


" let g:syntastic_cpp_compiler = 'gcc'
" let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -Wall -Werror -Wextra'
" let g:syntastic_check_on_open=1
" let g:syntastic_enable_signs=1
" let g:syntastic_cpp_check_header = 1
" let g:syntastic_cpp_remove_include_errors = 1
" let g:syntastic_c_include_dirs = ['../../../include', '../../include','../include','./include']
"

" " configure syntastic syntax checking to check on open as well as save
" let g:syntastic_check_on_open=1
" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
" let g:syntastic_eruby_ruby_quiet_messages =
"     \ {"regex": "possibly useless use of a variable in void context"}
"

"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Syntastic (syntax checker)
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Python
" let g:syntastic_python_checkers=['pyflakes']
"
" " Javascript
" let g:syntastic_javascript_checkers = ['jshint']
"
" " Go
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
"
" " Custom CoffeeScript SyntasticCheck
" func! SyntasticCheckCoffeescript()
"     let l:filename = substitute(expand("%:p"), '\(\w\+\)\.coffee', '.coffee.\1.js', '')
"     execute "tabedit " . l:filename
"     execute "SyntasticCheck"
"     execute "Errors"
" endfunc
" nnoremap <silent> <leader>l :call SyntasticCheckCoffeescript()<cr>
"
""   " syntastic {{{
"   nnoremap <silent>,l :SyntasticToggleMode<CR>
"   nnoremap <silent>,L :SyntasticCheck<CR>
"
"   let g:syntastic_check_on_open = 0
"   let g:syntastic_enable_highlighting = 0
"   let g:syntastic_echo_current_error = 0
"
"   let g:syntastic_javascript_checkers = [ 'jshint', 'jscs' ]
"   let g:syntastic_python_checkers = [ 'python' ]
"
"   " let g:syntastic_ruby_checkers = [ 'mri' ]
"   " let g:syntastic_sh_checkers = [ 'sh' ]
"   " let g:syntastic_slim_checkers = []
"
"   let g:syntastic_puppet_puppetlint_args = '--no-documentation-check'
"   let g:syntastic_ruby_rubocop_exec = expand('~/.rbenv/shims/rubocop')
"   let g:syntastic_ruby_rubocop_args = '-D'
"   let g:syntastic_ruby_slimrb_exec = expand('~/.rbenv/shims/slimrb')
"   let g:syntastic_sass_sass_exec = expand('~/.rbenv/shims/sass')
"   let g:syntastic_sass_sass_args = '-I .'
"   let g:syntastic_scss_sass_exec = expand('~/.rbenv/shims/sass')
"   let g:syntastic_scss_sass_args = '-I .'
"   let g:syntastic_sh_shellcheck_exec = 'shellcheck'
"   let g:syntastic_sh_shellcheck_args = '-e 2064,2086,2139,2155'
"
"   " autocmd vimrc BufRead */app/views/**/*.js.coffee
"   "   \ let b:syntastic_coffee_checkers = []
"   " autocmd vimrc BufEnter *.coffee
"   "   \ let g:syntastic_coffee_checkers = [ 'coffee', 'coffeelint' ]
"
"   if !&diff
"     let g:syntastic_auto_loc_list = 1
"     let g:syntastic_auto_jump = 0
"   endif
"   " }}}



" bundle/tabular
" -----------------------------------------
"   " tabular {{{
"   noremap ,a :Tabular /
"   noremap ,a{ :Tabular /{<CR>
"   noremap ,a} :Tabular /}<CR>
"   noremap ,a[ :Tabular /[<CR>
"   noremap ,a] :Tabular /]<CR>
"   noremap ,a= :Tabular /\(\|\|\)\?=\+>\?<CR>
"   noremap ,a, :Tabular /,\zs/l0r1<CR>
"   noremap ,a: :Tabular /[^:]:\s\zs/l0r1<CR>
"   " }}}
"


"     " Tabularize {
"         if isdirectory(expand("~/.vim/bundle/tabular"))
"             nmap <Leader>a& :Tabularize /&<CR>
"             vmap <Leader>a& :Tabularize /&<CR>
"             nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
"             vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
"             nmap <Leader>a=> :Tabularize /=><CR>
"             vmap <Leader>a=> :Tabularize /=><CR>
"             nmap <Leader>a: :Tabularize /:<CR>
"             vmap <Leader>a: :Tabularize /:<CR>
"             nmap <Leader>a:: :Tabularize /:\zs<CR>
"             vmap <Leader>a:: :Tabularize /:\zs<CR>
"             nmap <Leader>a, :Tabularize /,<CR>
"             vmap <Leader>a, :Tabularize /,<CR>
"             nmap <Leader>a,, :Tabularize /,\zs<CR>
"             vmap <Leader>a,, :Tabularize /,\zs<CR>
"             nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
"             vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
"         endif
"     " }
"

" bundle/tagbar
" -----------------------------------------

if isdirectory(expand("~/.vim/bundle/tagbar/"))
                        nnoremap <silent> <leader>tt :TagbarToggle<CR>
endif

" tagbar {{{
"   let g:tagbar_autoclose = 1
"   let g:tagbar_compact = 1
"   let g:tagbar_previewwin_pos = 'rightbelow'
"
"   nnoremap <silent> ,t :TagbarToggle<CR>
"   " }}}
"
"     " TagBar {
"         if isdirectory(expand("~/.vim/bundle/tagbar/"))
"             nnoremap <silent> <leader>tt :TagbarToggle<CR>
"         endif
"     "}

" bundle/tcomment_vim
" -----------------------------------------

noremap <C-/> :TComment<CR>

" bundle/ultisnips
" -----------------------------------------


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



" bundle/undotree
" -----------------------------------------

noremap <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 4
"
"     " UndoTree {
"         if isdirectory(expand("~/.vim/bundle/undotree/"))
"             nnoremap <Leader>u :UndotreeToggle<CR>
"             " If undotree is opened, it is likely one wants to interact with it.
"             let g:undotree_SetFocusWhenToggle=1
"         endif
"     " }
"

" bundle/vim-airline
" -----------------------------------------
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'



" bundle/vim-airline-themes
" -----------------------------------------
let g:airline_theme = 'murmur'


" bundle/vim-devicons
" -----------------------------------------

" bundle/vim-easymotion
" -----------------------------------------


" bundle/vim-easytags
" -----------------------------------------


" bundle/vim-expand-region
" -----------------------------------------


" bundle/vim-fugitive
" -----------------------------------------

"
"     " Fugitive {
"         if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
"             nnoremap <silent> <leader>gs :Gstatus<CR>
"             nnoremap <silent> <leader>gd :Gdiff<CR>
"             nnoremap <silent> <leader>gc :Gcommit<CR>
"             nnoremap <silent> <leader>gb :Gblame<CR>
"             nnoremap <silent> <leader>gl :Glog<CR>
"             nnoremap <silent> <leader>gp :Git push<CR>
"             nnoremap <silent> <leader>gr :Gread<CR>
"             nnoremap <silent> <leader>gw :Gwrite<CR>
"             nnoremap <silent> <leader>ge :Gedit<CR>
"             " Mnemonic _i_nteractive
"             nnoremap <silent> <leader>gi :Git add -p %<CR>
"             nnoremap <silent> <leader>gg :SignifyToggle<CR>
"         endif
"     "}
"

" bundle/vim-gitgutter
" -----------------------------------------

let g:gitgutter_max_signs = 99999

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Git gutter (Git diff)
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gitgutter_enabled=0
" nnoremap <silent> <leader>d :GitGutterToggle<cr>



" bundle/vim-monokai
" -----------------------------------------


" bundle/vim-multiple-cursors
" -----------------------------------------

let g:multi_cursor_start_key='<C-d>'
let g:multi_cursor_next_key='<C-d>'

" bundle/vim-nerdtree-tabs
" -----------------------------------------

" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

" bundle/vim-pathogen
" -----------------------------------------


" bundle/vim-polyglot
" -----------------------------------------


" bundle/vimproc.vim
" -----------------------------------------


" bundle/vim-rooter
" -----------------------------------------


"   " rooter {{{
"   let g:rooter_manual_only = 1
"   let g:rooter_change_directory_for_non_project_files = 0
"   let g:rooter_use_lcd = 1
"   let g:rooter_silent_chdir = 1
"   let g:rooter_patterns = ['Gemfile', 'package.json', 'bower.json', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']
"
"   if index(g:pathogen_disabled, 'rooter') == -1
"     autocmd vimrc BufEnter * if !isdirectory(expand('%')) | Rooter
"   endif
"   " }}}
"

" bundle/vimshell.vim
" -----------------------------------------


" bundle/vim-snippets
" -----------------------------------------


" bundle/vim-surround
" -----------------------------------------


" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>




" bundle/vim-table-mode
" -----------------------------------------


" bundle/vim-textobj-user
" -----------------------------------------


" bundle/YankRing.vim
" -----------------------------------------


""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
let g:yankring_history_dir = '~/.vim/tempdir'



" bundle/YouCompleteMe
" -----------------------------------------



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


