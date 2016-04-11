"
" fu! DoColor()
"         let identifier="bgColor"
"         let highlight="WildMenu"
"         if &ft ==# 'nerdtree'
"             highlight SignColumn ctermbg=white
"             highlight WildMenu ctermbg=white
"             highlight CursorLine ctermbg=gray
"             highlight Directory ctermfg=black
"             call ColorBG(identifier, highlight)
"         else
"             highlight SignColumn ctermbg=NONE
"             highlight WildMenu ctermbg=NONE
"             highlight CursorLine ctermbg=NONE
"         endif
" endfu
"
" fu! ColorBG(id, highlight)
"     exe "sign define " . a:id . " linehl=" . a:highlight
"     let lnum=1
"     while lnum <= line('$')
"         exe "sign place " . lnum . " line=" . lnum . " name=" . a:id . " buffer=" . bufnr('')
"         let lnum += 1
"     endwhile
" endfu
"
" fu! ExtendNT()
"     if &ft ==# 'nerdtree'
"         setlocal statusline=%#Normal#
"         setlocal modifiable
"         $read !echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
"         setlocal nomodifiable
"         normal gg
"     endif
" endfu
"
" autocmd WinEnter * call ExtendNT()
" autocmd WinLeave * call ExtendNT()
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline
" autocmd CursorMoved * call DoColor()
