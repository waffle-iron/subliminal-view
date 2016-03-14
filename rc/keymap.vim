" Text editing
noremap <C-/> :TComment<CR>
noremap <C-a> gg<S-v>G

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <C-S-j> mz:m+<cr>`z
nmap <C-S-k> mz:m-2<cr>`z
vmap <C-S-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-S-k> :m'<-2<cr>`>my`<mzgv`yo`z




" Find
noremap <C-f> /

" indent / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
nnoremap <Tab> >>
vnoremap <S-Tab> <
nnoremap <S-Tab> <<

" Cut, Paste, Copy
vnoremap <C-x> d
vnoremap <C-v> p
vnoremap <C-c> y
inoremap <C-x> <Esc>ddi
inoremap <C-v> <Esc>pi
inoremap <C-c> <Esc>yyi
nnoremap <C-x> dd
nnoremap <C-v> p
nnoremap <C-c> yy


" Undo, Redo
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
vnoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>
vnoremap <C-y>  <Esc>:redo<CR>
noremap <leader>u :GundoToggle<CR>


" Buffers (tabs) ----------------------------------------------------

" Save tab
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
vnoremap <C-s> <Esc>:w<CR>

" Save all tabs
nnoremap <C-S-s> :wa<CR>
inoremap <C-S-s> <Esc>:wa<CR>
vnoremap <C-S-s> <Esc>:wa<CR>

" Close tab
nnoremap <C-w> :bp <BAR> bd #<CR>
inoremap <C-w> <Esc>:bp <BAR> bd #<CR>
vnoremap <C-w> <Esc>:bp <BAR> bd #<CR>

" Close all tabs
nnoremap <C-S-w> :bufdo bd<CR>
inoremap <C-S-w> <Esc>:bufdo bd<CR>
vnoremap <C-S-w> <Esc>:bufdo bd<CR>

" Move back and forth through previous and next tabs
" with ,z and ,x
noremap <leader>z :bprevious<CR>
noremap <leader>x :bnext<CR>

" To open a new empty tab
nmap <leader>n :e

" Windows (splits) --------------------------------------------------

" Create window splits easier
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

" Navigate between split buffers windows
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l

" Resize windows with arrow keys
nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-
nnoremap <S-Left> <C-w><
nnoremap <S-Right>  <C-w>>


" Console (quickfix) ------------------------------------------------
" ,q to toggle quickfix window (where you have stuff like Ag)
" ,oq to open it back up (rare)
nmap <silent> <leader>qc :cclose<CR>
nmap <silent> <leader>qo :copen<CR>


" Navigation =================================================================

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0


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




