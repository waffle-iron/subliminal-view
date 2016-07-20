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

set nocompatible
set runtimepath=~/.subliminal-vim,~/.subliminal-vim/settings,$VIMRUNTIME

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

runtime common.vim
runtime keymap.vim
runtime library.vim
runtime commands.vim
runtime plugins.vim
