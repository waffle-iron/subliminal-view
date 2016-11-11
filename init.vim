"   This file is part of Subliminal View
"   Copyright (c) 2016, Subliminal View Developers
"
"   Please refer to CONTRIBUTORS.md for a complete list of Copyright
"   holders.
"
"   Subliminal View is free software: you can redistribute it and/or modify
"   it under the terms of the GNU General Public License as published by
"   the Free Software Foundation, either version 3 of the License, or
"   (at your option) any later version.
"
"   Subliminal View is distributed in the hope that it will be useful,
"   but WITHOUT ANY WARRANTY; without even the implied warranty of
"   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"   GNU General Public License for more details.
"
"   You should have received a copy of the GNU General Public License
"   along with this program. If not, see <http://www.gnu.org/licenses/>.

set nocompatible

let $VIM='~/.config/subliminal-view/runtime'
let $VIMRUNTIME='~/.config/subliminal-view/runtime'
set runtimepath=$VIMRUNTIME,~/.config/subliminal-view/plug

call plug#begin('~/.config/subliminal-view/plugins')

Plug 'LuisAlejandro/subliminal-view', {'dir': '~/.config/subliminal-view/app', 'do': './configure.sh', 'branch': 'development'}
Plug 'LuisAlejandro/vim-autoswap'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'tomtom/tcomment_vim'
Plug 'kristijanhusak/vim-multiple-cursors'
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dkprice/vim-easygrep'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'Shougo/unite.vim'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'

call plug#end()
