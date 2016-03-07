set nocompatible

" PLUGINS

" Pathogen
execute pathogen#infect()

" NERDTree
autocmd vimenter * NERDTree


" Indentation

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab


" UI

set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital



" Swap files

set noswapfile
set nobackup
set nowb

" Themes

colorscheme monokai                     " color scheme
let g:airline_theme='murmur'
let g:airline_powerline_fonts=1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

"set list listchars=tab:»·,trail:·,nbsp:·

set textwidth=80
set colorcolumn=+1
