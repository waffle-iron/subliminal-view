
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

let g:ctrlp_use_caching = 0 " ag is fast enough that CtrlP doesn't need to cache

let g:ctrlp_cmd = 'CtrlPMixed'			" search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_working_path_mode = 'ra'	" search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_switch_buffer = 'et'		" jump to a file if it's open already
let g:ctrlp_clear_cache_on_exit = 0  		" speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250 				" number of recently opened files
let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/]\.(git|hg|svn|build)$',
   \ 'file': '\v\.(exe|so|dll)$',
   \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
   \ }

" TODO: add javascript and some other languages who doesn't have ctags support
" coffee: https://gist.github.com/michaelglass/5210282
" go: http://stackoverflow.com/a/8236826/462233
" objc:  http://www.gregsexton.org/2011/04/objective-c-exuberant-ctags-regex/
" rust: https://github.com/mozilla/rust/blob/master/src/etc/ctags.rust
let g:ctrlp_buftag_types = {
\ 'go'     	   : '--language-force=go --golang-types=ftv',
\ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
\ 'markdown'   : '--language-force=markdown --markdown-types=hik',
\ 'objc'       : '--language-force=objc --objc-types=mpci',
\ 'rc'         : '--language-force=rust --rust-types=fTm'
\ }




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

"     " ctrlp {
"         if isdirectory(expand("~/.vim/bundle/ctrlp.vim/"))
"             let g:ctrlp_working_path_mode = 'ra'
"             nnoremap <silent> <D-t> :CtrlP<CR>
"             nnoremap <silent> <D-r> :CtrlPMRU<CR>
"             let g:ctrlp_custom_ignore = {
"                 \ 'dir':  '\.git$\|\.hg$\|\.svn$',
"                 \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
"
"             if executable('ag')
"                 let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
"             elseif executable('ack-grep')
"                 let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
"             elseif executable('ack')
"                 let s:ctrlp_fallback = 'ack %s --nocolor -f'
"             " On Windows use "dir" as fallback command.
"             elseif WINDOWS()
"                 let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
"             else
"                 let s:ctrlp_fallback = 'find %s -type f'
"             endif
"             if exists("g:ctrlp_user_command")
"                 unlet g:ctrlp_user_command
"             endif
"             let g:ctrlp_user_command = {
"                 \ 'types': {
"                     \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
"                     \ 2: ['.hg', 'hg --cwd %s locate -I .'],
"                 \ },
"                 \ 'fallback': s:ctrlp_fallback
"             \ }
"
"             if isdirectory(expand("~/.vim/bundle/ctrlp-funky/"))
"                 " CtrlP extensions
"                 let g:ctrlp_extensions = ['funky']
"
"                 "funky
"                 nnoremap <Leader>fu :CtrlPFunky<Cr>
"             endif
"         endif
"     "}
"
