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

