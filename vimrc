execute pathogen#infect()

set nocompatible
filetype plugin on
filetype indent on

" Indentation

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Folds

set foldmethod=indent   						" fold based on indent
set foldnestmax=3       						" deepest fold is 3 levels
set nofoldenable        						" dont fold by default

" Completion

set wildmenu                					"enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest

" Scrolling

set scrolloff=8         						" Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" UI

set number              						" show line numbers
set number              						" show line numbers
set showcmd             						" show command in bottom bar
set showmode            						" Show current mode down the bottom
set cursorline          						" highlight current line
set showmatch           						" highlight matching [{()}]
set incsearch           						" search as characters are entered
set hlsearch            						" highlight matches
set ignorecase          						" Ignore case when searching...
set smartcase           						" ...unless we type a capital
set textwidth=80
set colorcolumn=-1
set list
set listchars=tab:--,trail:·,extends:#,nbsp:·
set backspace=indent,eol,start 					" Allow backspace in insert mode
set history=1000                				" Store lots of :cmdline history
set visualbell                  				" No sounds
set autoread                    				" Reload files changed outside vim
set laststatus=2
set hidden										" This makes vim act like all other editors, buffers can
												" exist in the background without being in a window.
												" http://items.sjbach.com/319/configuring-vim-right
syntax on								   		" turn on syntax highlighting

let mapleader=','								" Change leader to a comma because the backslash is too far away
												" That means all \x commands turn into ,x
												" The mapleader has to be set before vundle starts loading all 
												" the plugins.
set splitbelow
set splitright
set mouse=a

" Swap files

set noswapfile
set nobackup
set nowritebackup

" Color themes

colorscheme monokai                     " color scheme
set t_Co=256							" tell the term has 256 colors

" Load particular settings for each plugin

for fpath in split(globpath('~/.vim/rc', '*.vim'), '\n')
    exe 'source' fpath
endfor
