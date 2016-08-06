"   This file is part of Sublime Vim
"   Copyright (c) 2016, Sublime Vim Developers
"
"   Please refer to CONTRIBUTORS.md for a complete list of Copyright
"   holders.
"
"   Tribus is free software: you can redistribute it and/or modify
"   it under the terms of the GNU General Public License as published by
"   the Free Software Foundation, either version 3 of the License, or
"   (at your option) any later version.
"
"   Tribus is distributed in the hope that it will be useful,
"   but WITHOUT ANY WARRANTY; without even the implied warranty of
"   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"   GNU General Public License for more details.
"
"   You should have received a copy of the GNU General Public License
"   along with this program. If not, see <http://www.gnu.org/licenses/>.

" ----------------------------------------------------------------------------
" SEARCH FUNCTIONS
" ----------------------------------------------------------------------------

" bundle/incsearch.vim
" ------------------------------------------------------------------
" <C-f>         - Search-forward entire file with visual increment (incsearch)
" <C-b>         - Search-backward entire file with visual increment (incsearch)
" <C-g>         - Search (still cursor) entire file with visual increment (incsearch)

let g:incsearch#consistent_n_direction = 1
let g:incsearch#emacs_like_keymap = 1
let g:incsearch#auto_nohlsearch = 1

map <silent> <C-f> <Plug>(incsearch-forward)
map <silent> /     <Plug>(incsearch-forward)
map <silent> <C-b> <Plug>(incsearch-backward)
map <silent> ?     <Plug>(incsearch-backward)
map <silent> <C-g> <Plug>(incsearch-stay)
map <silent> g/    <Plug>(incsearch-stay)

nmap <silent> n <Plug>(incsearch-nohl-n)
nmap <silent> N <Plug>(incsearch-nohl-N)
nmap <silent> * <Plug>(incsearch-nohl-*)
nmap <silent> # <Plug>(incsearch-nohl-#)
nmap <silent> g* <Plug>(incsearch-nohl-g*)
nmap <silent> g# <Plug>(incsearch-nohl-g#)

" bundle/unite.vim
" ------------------------------------------------------------------

"call unite#filters#matcher_default#use(['matcher_regexp'])
"call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <C-p> :Unite -start-insert -buffer-name=files file_rec/async<CR>
nnoremap <C-S-f> :Unite -start-insert -buffer-name=files grep:.<CR>

" Use ag (the silver searcher)
" https://github.com/ggreer/the_silver_searcher
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '-i --vimgrep --hidden --ignore ' .
\ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_file_rec_max_cache_files = 0
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']



let g:unite_source_menu_menus = {}

let g:unite_source_menu_menus.mappings = {
      \     'description' : 'mappings',
\ }

let g:unite_source_menu_menus.mappings.candidates = {
    \   'maps': 'Map',
    \ }
let g:unite_source_menu_menus.mappings.command_candidates = {
    \     'maps' : ':verbose map',
    \ }

" " Ag should search only on project root
" let g:ag_working_path_mode='r'
"
" " Use Ag over Grep
" set grepprg=ag\ --vimgrep
"
" " Call Ag to search for term in project
" nmap <silent> <leader>pf :call SearchProject()<CR>
"
" " Search for selected term in file (forwards)
" vmap <silent> <leader>ff :call VSearchFile('f')<CR>
"
" " Search for selected term in file (backwards)
" vmap <silent> <leader>fb :call VSearchFile('b')<CR>
"
" " Replace selected term with another inside file
" vmap <silent> <leader>fr :call VSearchReplaceFile()<CR>
"


" bundle/vim-easygrep
" ----------------------------------------------------------------------------
" <leader>vv    - Grep for the word under the cursor, match all occurences, like 'g*'
" <leader>vV    - Grep for the word under the cursor, match whole word, like '*'.
" <leader>va    - Like vv, but add to existing list.
" <leader>vA    - Like vV, but add to existing list.
" <leader>vr    - Perform a global search on the word under the cursor and prompt for a pattern with which to replace it.
" <leader>vR    - Like vr, but match whole word.

let g:EasyGrepCommand = 1   

" bundle/auto-pairs
" ----------------------------------------------------------------------------


" bundle/goyo.vim
" ----------------------------------------------------------------------------


" bundle/nerdtree
" ----------------------------------------------------------------------------

" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeMouseMode = 3
let NERDTreeIgnore = ['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$',
            \ '^\.hg$', '^\.svn$', '\.bzr$']

" bundle/syntastic
" ----------------------------------------------------------------------------

" show the error list automatically
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "\uf12a"
let g:syntastic_style_error_symbol = "\uf12a"
let g:syntastic_warning_symbol = "\uf12a"
let g:syntastic_style_warning_symbol = "\uf12a"
let g:syntastic_stl_format = "%E{%e Errors}%B{, }%W{%w Warnings}"

" Python
let g:syntastic_python_checkers = ['python', 'pep8', 'pylint', 'pyflakes', 'pydocstyle']
let g:syntastic_python_python_exec = '~/.subliminal-vim/sandboxes/python/bin/python'
let g:syntastic_python_pep8_exec = '~/.subliminal-vim/sandboxes/python/bin/pep8'
let g:syntastic_python_pylint_exec = '~/.subliminal-vim/sandboxes/python/bin/pylint'
let g:syntastic_python_pyflakes_exec = '~/.subliminal-vim/sandboxes/python/bin/pyflakes'
let g:syntastic_python_pydocstyle_exec = '~/.subliminal-vim/sandboxes/python/bin/pydocstyle'

" Ruby
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_ruby_mri_exec = '~/.subliminal-vim/sandboxes/ruby/bin/ruby'
let g:syntastic_ruby_rubocop_exec = '~/.subliminal-vim/sandboxes/ruby/bin/rubocop'

" Shell
let g:syntastic_sh_checkers = ['sh', 'checkbashisms', 'shellcheck']
let g:syntastic_sh_sh_exec = '/usr/bin/bash'
let g:syntastic_sh_checkbashisms_exec = '/usr/bin/checkbashisms'
let g:syntastic_sh_shellcheck_exec = '/usr/bin/shellcheck'

" Javascript
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_javascript_jshint_exec =  '~/.subliminal-vim/sandboxes/node/node_modules/.bin/jshint'
let g:syntastic_javascript_jscs_exec =  '~/.subliminal-vim/sandboxes/node/node_modules/.bin/jscs'

" Go
let g:syntastic_go_checkers = ['go', 'gometalinter']
let g:syntastic_go_go_exec = '/usr/bin/go'
let g:syntastic_go_gometalinter_exec = '~/.subliminal-vim/sandboxes/go/bin/gometalinter'

" Markdown
let g:syntastic_markdown_checkers = ['textlint']
let g:syntastic_markdown_textlint_exec =  '~/.subliminal-vim/sandboxes/node/node_modules/.bin/textlint'

" HTML
let g:syntastic_html_checkers = ['textlint']
let g:syntastic_html_textlint_exec =  '~/.subliminal-vim/sandboxes/node/node_modules/.bin/textlint'

" CSS
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_css_csslint_exec =  '~/.subliminal-vim/sandboxes/node/node_modules/.bin/csslint'

" C
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_c_gcc_exec = '/usr/bin/gcc'

" C++
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_gcc_exec = '/usr/bin/gcc'

" C#
let g:syntastic_cs_checkers = ['mcs']
let g:syntastic_cs_mcs_exec = '/usr/bin/mcs'

" Vim
let g:syntastic_vim_checkers = ['vint']
let g:syntastic_vim_vint_exec = '~/.subliminal-vim/sandboxes/python/bin/vint'

" SQL
let g:syntastic_sql_checkers = ['sqlint']
let g:syntastic_sql_sqlint_exec = '~/.subliminal-vim/sandboxes/ruby/bin/sqlint'

" PHP
let g:syntastic_php_checkers = ['php']
let g:syntastic_php_php_exec = '/usr/bin/php'

" Perl
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_perl_perl_exec = '/usr/bin/perl'

" Rust
let g:syntastic_rust_checkers = ['rustc']
let g:syntastic_rust_rustc_exec = '/usr/bin/rustc'

" Docker
let g:syntastic_dockerfile_checkers = ['dockerfile_lint']
let g:syntastic_dockerfile_dockerfile_lint_exec =  '~/.subliminal-vim/sandboxes/node/node_modules/.bin/dockerfile_lint'

" JSON
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_json_jsonlint_exec =  '~/.subliminal-vim/sandboxes/node/node_modules/.bin/jsonlint'


" bundle/tcomment_vim
" ------------------------------------------------------------------

" nmap <silent> <C-/> :TComment<CR>

" bundle/vim-airline
" ------------------------------------------------------------------

let g:airline_theme = 'subliminal'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = "\ue0b8"
let g:airline_left_alt_sep = "\ue0b9"
let g:airline_right_sep = "\ue0ba"
let g:airline_right_alt_sep = "\ue0bb"

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_type = 0

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = "\ue0b8"
let g:airline#extensions#tabline#left_alt_sep = "\ue0b9"
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent[%s]'
let g:airline#extensions#whitespace#long_format = 'long[%s]'
let g:airline#extensions#whitespace#mixed_indent_file_format = 'mix-indent-file[%s]'

let g:airline#extensions#default#layout = [
            \ ['a', 'b', 'warning', 'error', 'c'], ['x', 'y', 'z']
            \ ]

" bundle/vim-devicons
" ------------------------------------------------------------------

let g:webdevicons_enable_airline_tabline = 0
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:NERDTreeUpdateOnCursorHold = 0
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = "\uf114"
let g:DevIconsDefaultFolderOpenSymbol = "\uf115"

" bundle/vim-easytags
" ------------------------------------------------------------------

let g:easytags_async = 1
let g:easytags_file = '~/.subliminal-vim/vimtags'
let g:easytags_include_members = 1
let g:easytags_auto_highlight = 0
let g:easytags_resolve_links = 1
let g:easytags_suppress_report = 1
let g:easytags_suppress_ctags_warning = 1

" bundle/vim-gitgutter
" ------------------------------------------------------------------

let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 99999
let g:gitgutter_sign_added = "\uf067"
let g:gitgutter_sign_modified = "\uf142"
let g:gitgutter_sign_removed = "\uf068"
let g:gitgutter_sign_modified_removed = "\uf068"

" bundle/vim-multiple-cursors
" ------------------------------------------------------------------

let g:multi_cursor_start_key = '<C-d>'
let g:multi_cursor_next_key = '<C-d>'

" bundle/vim-polyglot
" ------------------------------------------------------------------


" bundle/vim-surround
" ------------------------------------------------------------------
" " ," Surround a word with "quotes"
" map ," ysiw"
" vmap ," c"<C-R>""<ESC>
"
" " ,' Surround a word with 'single quotes'
" map ,' ysiw'
" vmap ,' c'<C-R>"'<ESC>
"
" " ,) or ,( Surround a word with (parens)
" " The difference is in whether a space is put in
" map ,( ysiw(
" map ,) ysiw)
" vmap ,( c( <C-R>" )<ESC>
" vmap ,) c(<C-R>")<ESC>
"
" " ,[ Surround a word with [brackets]
" map ,] ysiw]
" map ,[ ysiw[
" vmap ,[ c[ <C-R>" ]<ESC>
" vmap ,] c[<C-R>"]<ESC>
"
" " ,{ Surround a word with {braces}
" map ,} ysiw}
" map ,{ ysiw{
" vmap ,} c{ <C-R>" }<ESC>
" vmap ,{ c{<C-R>"}<ESC>

" bundle/neocomplete
" ------------------------------------------------------------------

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15
let g:neocomplete#force_overwrite_completefunc = 1

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.c='[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.cpp='[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.xml='<[^>]*'
let g:neocomplete#sources#omni#input_patterns.html='<[^>]*'
let g:neocomplete#sources#omni#input_patterns.markdown='<[^>]*'
let g:neocomplete#sources#omni#input_patterns.css='^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
let g:neocomplete#sources#omni#input_patterns.less='^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
let g:neocomplete#sources#omni#input_patterns.javascript='[^. \t]\.\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.json='[^. \t]\.\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.python='\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#sources#omni#input_patterns.python3='\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#sources#omni#input_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.php='[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.go='\h\w*\%.'
let g:neocomplete#sources#omni#input_patterns.perl='\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.java='\%(\h\w*\|)\)\.'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" bundle/neosnippets
" ------------------------------------------------------------------



