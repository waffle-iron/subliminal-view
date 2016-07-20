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

filetype plugin on
filetype indent on

" Indentation

set nowrap
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Folds

set foldnestmax=3                             " deepest fold is 3 levels
set foldmethod=indent                         " fold based on indent
set nofoldenable                                " dont fold by default

" Completion

set wildmenu                                    "enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest,full
set wildignore=*.pyc,*.o,*.lo,*.la,*.exe,*.swp,*.db,*.bak,*.old,*.dat,*.,tmp,*.mdb,*~,~*

" Scrolling

"set scrolloff=999                             " Start scrolling when we're 8 lines away from margins

" UI

set lazyredraw
set number                                      " show line numbers
set showcmd                                     " show command in bottom bar
set showmode                                    " Show current mode down the bottom
set cursorline                                  " highlight current line
set showmatch                                   " highlight matching [{()}]
set incsearch                                   " search as characters are entered
set hlsearch                                    " highlight matches
set ignorecase                                  " Ignore case when searching...
set smartcase                                   " ...unless we type a capital
set textwidth=80
set colorcolumn=-1
set list
set listchars=tab:--,trail:·,extends:#,nbsp:.
set backspace=indent,eol,start                " Allow backspace in insert mode
set history=1000                              " Store lots of :cmdline history
set novisualbell                                " No sounds
set laststatus=2

set hidden                                      " This makes vim act like all other editors, buffers can
                                                " exist in the background without being in a window.
                                                " http://items.sjbach.com/319/configuring-vim-right

syntax on                                       " turn on syntax highlighting
set splitright                                  " Split vertical windows right to the current windows
set splitbelow                                  " Split horizontal windows below to the current windows

let mapleader=','                               " Change leader to a comma because the backslash is too far away
                                                " That means all \x commands turn into ,x
set mouse=a
set mousehide

set encoding=utf-8                            " Set default encoding to UTF-8
scriptencoding utf-8

" Swap files

set autoread                                    " Reload files changed outside vim
set autowrite                                   " Automatically save before :next, :make etc.
set noswapfile
set nobackup
set nowritebackup

" Color themes

colorscheme monokai                             " color scheme
set t_Co=256                                  " tell the term has 256 colors

set pastetoggle=<F2>

" Use one space, not two, after punctuation.
set nojoinspaces


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undodir=~/.vim/tempdir
set undofile
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

" window/icon titles

set title
set icon
let &titlestring='%F (%{ProjectFilePath(1)}) - Subliminal Vim'
let &iconstring=&titlestring

set clipboard=unnamed,unnamedplus
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character

set linespace=0                 " No extra spaces between rows
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set listchars=tab:--,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

set timeout ttimeoutlen=50

