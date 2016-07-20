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



" Sublime Text key noremappings

map <Esc>[65;5~ <C-S-a>
map <Esc>[66;5~ <C-S-b>
map <Esc>[67;5~ <C-S-c>
map <Esc>[68;5~ <C-S-d>
map <Esc>[69;5~ <C-S-e>
map <Esc>[70;5~ <C-S-f>
map <Esc>[71;5~ <C-S-g>
map <Esc>[72;5~ <C-S-h>
map <Esc>[73;5~ <C-S-i>
map <Esc>[74;5~ <C-S-j>
map <Esc>[75;5~ <C-S-k>
map <Esc>[76;5~ <C-S-l>
map <Esc>[77;5~ <C-S-m>
map <Esc>[78;5~ <C-S-n>
map <Esc>[79;5~ <C-S-o>
map <Esc>[80;5~ <C-S-p>
map <Esc>[81;5~ <C-S-q>
map <Esc>[82;5~ <C-S-r>
map <Esc>[83;5~ <C-S-s>
map <Esc>[84;5~ <C-S-t>
map <Esc>[85;5~ <C-S-u>
map <Esc>[86;5~ <C-S-v>
map <Esc>[87;5~ <C-S-w>
map <Esc>[88;5~ <C-S-x>
map <Esc>[89;5~ <C-S-y>
map <Esc>[90;5~ <C-S-z>

" Open last closed tab
noremap <silent> <Esc>[84;5~ :vs<BAR>:b#<CR>


" Text editing
noremap <silent> <C-a> ggVG

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <silent> <C-S-Down> mz:m+<cr>`z
vnoremap <silent> <C-S-Down> :m'>+<cr>`<my`>mzgv`yo`z
nnoremap <silent> <C-S-Up> mz:m-2<cr>`z
vnoremap <silent> <C-S-Up> :m'<-2<cr>`>my`<mzgv`yo`z

" duplicate the selection
nnoremap <silent> <Esc>[68;5~ yyp
vnoremap <silent> <Esc>[68;5~ yp
inoremap <silent> <Esc>[68;5~ <Esc>yypi

" indent / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <silent> <Tab> >gv
nnoremap <silent> <Tab> >>
vnoremap <silent> <S-Tab> <gv
nnoremap <silent> <S-Tab> <<

" Cut, Paste, Copy
vnoremap <silent> <C-x> "xygvd:call system('xsel -i -b', @x)<CR>v
nnoremap <silent> <C-x> "xdd:call system('xsel -i -b', @x)<CR>
inoremap <silent> <C-x> <Esc>"xdd:call system('xsel -i -b', @x)<CR>i

vnoremap <silent> <C-v> :let @x=system('xsel -b')<CR>"xpv
nnoremap <silent> <C-v> :let @x=system('xsel -b')<CR>"xp
inoremap <silent> <C-v> <Esc>:let @x=system('xsel -b')<CR>"xpi

vnoremap <silent> <C-c> "xy:call system('xsel -i -b', @x)<CR>v
nnoremap <silent> <C-c> "xyy:call system('xsel -i -b', @x)<CR>
inoremap <silent> <C-c> <Esc>"xyy:call system('xsel -i -b', @x)<CR>i

" Undo, Redo
nnoremap <silent> <C-z> :undo<CR>
inoremap <silent> <C-z> <Esc>:undo<CR>
vnoremap <silent> <C-z> <Esc>:undo<CR>
nnoremap <silent> <C-y> :redo<CR>
inoremap <silent> <C-y> <Esc>:redo<CR>
vnoremap <silent> <C-y> <Esc>:redo<CR>


" Buffers (tabs) ----------------------------------------------------

" Save tab
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>
vnoremap <silent> <C-s> <Esc>:w<CR>

" Save all tabs
nnoremap <silent> <C-e> :wa<CR>
inoremap <silent> <C-e> <Esc>:wa<CR>
vnoremap <silent> <C-e> <Esc>:wa<CR>

" Close tab
nnoremap <silent> <C-w> :bp <BAR> bd #<CR>
inoremap <silent> <C-w> <Esc>:bp <BAR> bd #<CR>
vnoremap <silent> <C-w> <Esc>:bp <BAR> bd #<CR>

" Close all tabs
nnoremap <silent> <C-q> :bufdo bd<CR>
inoremap <silent> <C-q> <Esc>:bufdo bd<CR>
vnoremap <silent> <C-q> <Esc>:bufdo bd<CR>

" Move back and forth through previous and next tabs
" with ,z and ,x
noremap <silent> <leader>z :bprevious<CR>
noremap <silent> <leader>x :bnext<CR>

" To open a new empty tab
nnoremap <silent> <leader>n :e<SPACE>

" Windows (splits) --------------------------------------------------

" Create window splits easier
nnoremap <silent> <leader>v <C-w>v
nnoremap <silent> <leader>s <C-w>s

" Close split
nnoremap <silent> <leader>q <C-w>q

" Navigate between split buffers windows
nnoremap <silent> <C-Down> <C-w>j<C-w>_
nnoremap <silent> <C-Up> <C-w>k<C-w>_
nnoremap <silent> <C-Left> <C-w>h<C-w>_
nnoremap <silent> <C-Right> <C-w>l<C-w>_

" Resize windows with arrow keys
" nnoremap <silent> <S-Up> <C-w>+
" nnoremap <silent> <S-Down> <C-w>-
" nnoremap <silent> <S-Left> <C-w><
" nnoremap <silent> <S-Right>  <C-w>>
"
" Console (quickfix) ------------------------------------------------
" ,q to toggle quickfix window (where you have stuff like Ag)
" ,oq to open it back up (rare)
nnoremap <silent> <leader>qc :cclose<CR>
nnoremap <silent> <leader>qo :copen<CR>


" Navigation =================================================================

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0


