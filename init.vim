"   This file is part of Sublime Vim
"   Copyright (c) 2016, Sublime Vim Developers
"
"   Please refer to CONTRIBUTORS.md for a complete list of Copyright
"   holders.
"
"   Subliminal Vim is free software: you can redistribute it and/or modify
"   it under the terms of the GNU General Public License as published by
"   the Free Software Foundation, either version 3 of the License, or
"   (at your option) any later version.
"
"   Subliminal Vim is distributed in the hope that it will be useful,
"   but WITHOUT ANY WARRANTY; without even the implied warranty of
"   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"   GNU General Public License for more details.
"
"   You should have received a copy of the GNU General Public License
"   along with this program. If not, see <http://www.gnu.org/licenses/>.

set runtimepath=~/.subliminal-vim/app,$VIMRUNTIME

call plug#begin('~/.subliminal-vim/plugins')

Plug 'LuisAlejandro/subliminal-vim', {'dir': '~/.subliminal-vim/app', 'do': 'bash install.sh'}
Plug 'LuisAlejandro/vim-autoswap'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'kristijanhusak/vim-multiple-cursors'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dkprice/vim-easygrep'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'Shougo/unite.vim'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/syntastic'
Plug 'ryanoasis/vim-devicons'

call plug#end()
