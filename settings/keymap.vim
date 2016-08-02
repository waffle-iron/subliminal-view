"   This file is part of Sublime Vim
"   Copyright (c) 2016, Sublime Vim Developers
"
"   Please refer to CONTRIBUTORS.md for a complete list of Copyright
"   holders.
"
"   Subliminal Vim is free software: you can redistribute it and/or modify
"   it under the terms of the GNU General Public License as published by
"   the Free Software Foundation, either version 4 of the License, or
"   (at your option) any later version.
"
"   Subliminal Vim is distributed in the hope that it will be useful,
"   but WITHOUT ANY WARRANTY; without even the implied warranty of
"   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"   GNU General Public License for more details.
"
"   You should have received a copy of the GNU General Public License
"   along with this program. If not, see <http://www.gnu.org/licenses/>.


" Interface
" ----------------------------------------------------------------------------

" Exit
map <silent> <C-q> :call system('pkill -P $(pgrep -d, urxvt)')<CR>
map! <silent> <C-q> <Esc>:call system('pkill -P $(pgrep -d, urxvt)')<CR>

" New window
map <silent> <Esc>[78;5~ :call system('subliminal-vim')<CR>
map! <silent> <Esc>[78;5~ <Esc>:call system('subliminal-vim')<CR>

" Close window
map <silent> <Esc>[87;5~ :q!<CR>
map! <silent> <Esc>[87;5~ <Esc>:q!<CR>

" Open file
map <silent> <C-o> :call OpenFile()<CR>
map! <silent> <C-o> <Esc>:call OpenFile()<CR>

" Open last closed tab
map <silent> <Esc>[84;5~ :e#<CR>
map! <silent> <Esc>[84;5~ <Esc>:e#<CR>

" Open a new unnamed file
map <silent> <C-n> :enew<CR>
map! <silent> <C-n> <Esc>:enew<CR>

" Save file
map <silent> <C-s> :call SaveFile()<CR>
map! <silent> <C-s> <Esc>:call SaveFile()<CR>

" Save file as
map <silent> <Esc>[83;5~ :call SaveFileAs()<CR>
map! <silent> <Esc>[83;5~ <Esc>:call SaveFileAs()<CR>

" Close file
map <silent> <C-w> :call CloseFile()<CR>
map! <silent> <C-w> <Esc>:call CloseFile()<CR>
map <silent> <Esc>[1;5S :call CloseFile()<CR>
map! <silent> <Esc>[1;5S <Esc>:call CloseFile()<CR>

" Show/Hide sidebar
map <silent> <C-k><C-b> :NERDTreeToggle<CR>
map! <silent> <C-k><C-b> <Esc>:NERDTreeToggle<CR>

" Distraction free mode
map <silent> <Esc>[23;2~ :Goyo<CR>
map! <silent> <Esc>[23;2~ <Esc>:Goyo<CR>

" Navigate between tabs
map <silent> <Esc>1              <Plug>AirlineSelectTab1
map <silent> <Esc>2              <Plug>AirlineSelectTab2
map <silent> <Esc>3              <Plug>AirlineSelectTab3
map <silent> <Esc>4              <Plug>AirlineSelectTab4
map <silent> <Esc>5              <Plug>AirlineSelectTab5
map <silent> <Esc>6              <Plug>AirlineSelectTab6
map <silent> <Esc>7              <Plug>AirlineSelectTab7
map <silent> <Esc>8              <Plug>AirlineSelectTab8
map <silent> <Esc>9              <Plug>AirlineSelectTab9
map <silent> <Esc>[27;5;9~       <Plug>AirlineSelectPrevTab
map <silent> <Esc>[27;6;9~       <Plug>AirlineSelectNextTab

map! <silent> <Esc>1              <Esc><Plug>AirlineSelectTab1
map! <silent> <Esc>2              <Esc><Plug>AirlineSelectTab2
map! <silent> <Esc>3              <Esc><Plug>AirlineSelectTab3
map! <silent> <Esc>4              <Esc><Plug>AirlineSelectTab4
map! <silent> <Esc>5              <Esc><Plug>AirlineSelectTab5
map! <silent> <Esc>6              <Esc><Plug>AirlineSelectTab6
map! <silent> <Esc>7              <Esc><Plug>AirlineSelectTab7
map! <silent> <Esc>8              <Esc><Plug>AirlineSelectTab8
map! <silent> <Esc>9              <Esc><Plug>AirlineSelectTab9
map! <silent> <Esc>[27;5;9~       <Esc><Plug>AirlineSelectPrevTab
map! <silent> <Esc>[27;6;9~       <Esc><Plug>AirlineSelectNextTab

" Save all tabs
inoremap <silent> <C-e> <Esc>:wa!<CR>


" Select all document
inoremap <silent> <C-a> <Esc>ggVG


" Select with Shift + cursor keys
inoremap <silent> <S-Up>        <Esc>v<Up>
vnoremap <silent> <S-Up>        <Up>
inoremap <silent> <S-Down>      <Esc>v<Down>
vnoremap <silent> <S-Down>      <Down>
inoremap <silent> <S-Left>      <Esc>v<Left>
vnoremap <silent> <S-Left>      <Left>
inoremap <silent> <S-Right>     <Esc>v<Right>
vnoremap <silent> <S-Right>     <Right>

" Move a block or line of text up or down
inoremap <silent> <Esc>[1;6A    <Esc>:m-2<CR>
vnoremap <silent> <Esc>[1;6A    :m'<-2<CR>`>my`<mzgv`yo`z
inoremap <silent> <Esc>[1;6B    <Esc>:m+<CR>
vnoremap <silent> <Esc>[1;6B    :m'>+<CR>`<my`>mzgv`yo`z

" Duplicate the selection
inoremap <silent> <Esc>[68;5~   <Esc>yypi
vnoremap <silent> <Esc>[68;5~   yp

" Indent a line or block of code
inoremap <silent> <Tab>         <Esc>>>
vnoremap <silent> <Tab>         >gv

" Deindent a line or block of code
inoremap <silent> <S-Tab>       <Esc><<
vnoremap <silent> <S-Tab>       <gv

" Copy
inoremap <silent> <C-c>         <Esc>"xyy:call system('xsel -i -b', @x)<CR>i
vnoremap <silent> <C-c>         "xy:call system('xsel -i -b', @x)<CR>i

" Cut
inoremap <silent> <C-x>         <Esc>"xdd:call system('xsel -i -b', @x)<CR>i
vnoremap <silent> <C-x>         "xygvd:call system('xsel -i -b', @x)<CR>i

" Paste
inoremap <silent> <C-v>         <Esc>:let @x=system('xsel -b')<CR>"xpi
vnoremap <silent> <C-v>         :let @x=system('xsel -b')<CR>"xpi

" Undo
inoremap <silent> <C-z> <Esc>:undo<CR>
vnoremap <silent> <C-z> <Esc>:undo<CR>

" Redo
inoremap <silent> <C-y> <Esc>:redo<CR>
vnoremap <silent> <C-y> <Esc>:redo<CR>
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



