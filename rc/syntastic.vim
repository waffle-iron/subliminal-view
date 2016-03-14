" Syntax highlighting --------------------------------------------------------

"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1

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
"
