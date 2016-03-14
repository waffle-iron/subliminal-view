 " Open ctrlp with cmd+p
" let g:ctrlp_map = '<D-p>'
"
" " Open goto symbol on current buffer
" nmap <D-r> :MyCtrlPTag<cr>
" imap <D-r> <esc>:MyCtrlPTag<cr>
"
" " Open goto symbol on all buffers
" nmap <D-R> :CtrlPBufTagAll<cr>
" imap <D-R> <esc>:CtrlPBufTagAll<cr>
"
" " Open goto file
" nmap <D-t> :CtrlP<cr>
" imap <D-t> <esc>:CtrlP<cr>
" "
"
" let g:ctrlp_map = '<C-f>'
" let g:ctrlp_cmd = 'CtrlP'
"

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
"
"
" let g:ctrlp_cmd = 'CtrlPMixed'			" search anything (in files, buffers and MRU files at the same time.)
" let g:ctrlp_working_path_mode = 'ra'	" search for nearest ancestor like .git, .hg, and the directory of the current file
" let g:ctrlp_match_window_bottom = 0		" show the match window at the top of the screen
" let g:ctrlp_by_filename = 1
" let g:ctrlp_max_height = 10				" maxiumum height of match window
" let g:ctrlp_switch_buffer = 'et'		" jump to a file if it's open already
" let g:ctrlp_use_caching = 1				" enable caching
" let g:ctrlp_clear_cache_on_exit=0  		" speed up by not removing clearing cache evertime
" let g:ctrlp_mruf_max = 250 				" number of recently opened files
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn|build)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
"   \ }
"
" func! MyPrtMappings()
"     let g:ctrlp_prompt_mappings = {
"         \ 'AcceptSelection("e")': ['<c-t>'],
"         \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
"         \ }
" endfunc
"
" func! MyCtrlPTag()
"     let g:ctrlp_prompt_mappings = {
"         \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
"         \ 'AcceptSelection("t")': ['<c-t>'],
"         \ }
"     CtrlPBufTag
" endfunc
"
" let g:ctrlp_buffer_func = { 'exit': 'MyPrtMappings' }
" com! MyCtrlPTag call MyCtrlPTag()
"
" " TODO: add javascript and some other languages who doesn't have ctags support
" " coffee: https://gist.github.com/michaelglass/5210282
" " go: http://stackoverflow.com/a/8236826/462233
" " objc:  http://www.gregsexton.org/2011/04/objective-c-exuberant-ctags-regex/
" " rust: https://github.com/mozilla/rust/blob/master/src/etc/ctags.rust
" let g:ctrlp_buftag_types = {
" \ 'go'     	   : '--language-force=go --golang-types=ftv',
" \ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
" \ 'markdown'   : '--language-force=markdown --markdown-types=hik',
" \ 'objc'       : '--language-force=objc --objc-types=mpci',
" \ 'rc'         : '--language-force=rust --rust-types=fTm'
" \ }



  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0




"
"
" """"""""""""""""""""""""""""""
" " => CTRL-P
" """"""""""""""""""""""""""""""
" let g:ctrlp_working_path_mode = 0
"
" let g:ctrlp_map = '<c-f>'
" map <leader>j :CtrlP<cr>
" map <c-b> :CtrlPBuffer<cr>
"
" let g:ctrlp_max_height = 20
" let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
"
"
