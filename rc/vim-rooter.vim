
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
