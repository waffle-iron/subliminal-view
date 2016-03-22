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
