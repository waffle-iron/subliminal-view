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


