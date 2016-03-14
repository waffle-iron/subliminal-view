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

set lazyredraw
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
set autoread                    				" Reload files changed outside vim
set autowrite                    				" Automatically save before :next, :make etc.
set visualbell                  				" No sounds
set laststatus=2
set hidden										" This makes vim act like all other editors, buffers can
												" exist in the background without being in a window.
												" http://items.sjbach.com/319/configuring-vim-right
syntax on								   		" turn on syntax highlighting
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
let mapleader=','								" Change leader to a comma because the backslash is too far away
												" That means all \x commands turn into ,x
												" The mapleader has to be set before vundle starts loading all
												" the plugins.
set mouse=a
set encoding=utf-8              " Set default encoding to UTF-8

" Swap files

set noswapfile
set nobackup
set nowritebackup

" Color themes

colorscheme monokai                     " color scheme
set t_Co=256							" tell the term has 256 colors



set pastetoggle=<F2>
" show matching brackets
set showmatch

set clipboard=unnamed

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" Use Ag over Grep
set grepprg=ag\ --nogroup\ --nocolor

" " Tab completion
" " will insert tab at beginning of line,
" " will use completion if not at beginning
" set wildmode=list:longest,list:full
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction
" inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <S-Tab> <c-n>

" Ignore compiled files
" set wildignore=*.o,*~,*.pyc
" if has("win16") || has("win32")
"     set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
" else
"     set wildignore+=.git\*,.hg\*,.svn\*
" endif


"
" """"""""""""""""""""""""""""""
" " => Visual mode related
" """"""""""""""""""""""""""""""
" " Visual mode pressing * or # searches for the current selection
" " Super useful! From an idea by Michael Naumann
" vnoremap <silent> * :call VisualSelection('f', '')<CR>
" vnoremap <silent> # :call VisualSelection('b', '')<CR>
"
"


" " Let 'tl' toggle between this and the last accessed tab
" let g:lasttab = 1
" nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
" au TabLeave * let g:lasttab = tabpagenr()
"
"
" " Opens a new tab with the current buffer's path
" " Super useful when editing files in the same directory
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"
" " Switch CWD to the directory of the open buffer
" map <leader>cd :cd %:p:h<cr>:pwd<cr>
"
" " Specify the behavior when switching between buffers
" try
"   set switchbuf=useopen,usetab,newtab
"   set stal=2
" catch
" endtry
"

"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Ag searching and cope displaying
" "    requires ag.vim - it's much better than vimgrep/grep
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " When you press gv you Ag after the selected text
" vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
"
" " Open Ag and put the cursor in the right position
" map <leader>g :Ag
"
" " When you press <leader>r you can search and replace the selected text
" vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
"
" " Do :help cope if you are unsure what cope is. It's super useful!
" "
" " When you search with Ag, display your results in cope by doing:
" "   <leader>cc
" "
" " To go to the next search result do:
" "   <leader>n
" "
" " To go to the previous search results do:
" "   <leader>p
" "
" map <leader>cc :botright cope<cr>
" map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim/tempdir
    set undofile
catch
endtry



""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
let g:yankring_history_dir = '~/.vim/tempdir'

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => vim-multiple-cursors
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:multi_cursor_next_key="\<C-s>"

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Goyo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:goyo_width=100
" let g:goyo_margin_top = 2
" let g:goyo_margin_bottom = 2
" nnoremap <silent> <leader>z :Goyo<cr>
"
set wildmenu
set wildmode=list:longest,full
set wildignore=*.pyc,*.o,*.lo,*.la,*.exe,*.swp,*.db,*.bak,*.old,*.dat,*.,tmp,*.mdb,*~,~*
"
" automatically open quickfix window after commands that modify the quickfix list
"autocmd vimrc QuickFixCmdPost *grep* if len(getqflist()) | copen | endif
"
" highlight trailing whitespace
"autocmd vimrc VimEnter,Colorscheme * highlight Whitespace ctermbg=235 guibg=#333333
"autocmd vimrc VimEnter,Colorscheme * match Whitespace /[^ \t]\s\+$/
" window/icon titles
set title
set icon

let &titlestring = "%t%m%r\ \[%{ProjectFilepath(1)}\]"
let &iconstring = &titlestring

" " }}}
"
" " Commands
" " {{{
"
"   " helper to preserve search and cursor position
"   command! -nargs=1 Preserve call <SID>Preserve(<args>)
"   function! s:Preserve(command) " {{{
"     let search=@/
"     let line = line('.')
"     let column = col('.')
"     execute a:command
"     let @/ = search
"     call cursor(line, column)
"   endfunction " }}}
"
"   command! -nargs=1 PreserveSearch call <SID>PreserveSearch(<args>)
"   function! s:PreserveSearch(command) " {{{
"     let search=@/
"     execute a:command
"     let @/ = search
"   endfunction " }}}
"
"   " Replace a builtin command using cabbrev
"   " http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
"   command! -nargs=+ CommandAlias call <SID>CommandAlias(<f-args>)
"   function! s:CommandAlias(abbreviation, expansion) " {{{
"     execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
" endfunction " }}}
"
"   CommandAlias E e
"   CommandAlias E! e!
"   CommandAlias Q Q
"   CommandAlias Q! Q!
"   CommandAlias QA qa
"   CommandAlias Qa qa
"   CommandAlias qA qa
"   CommandAlias QA! qa!
"   CommandAlias Qa! qa!
"   CommandAlias qA! qa!
"   CommandAlias WQ wq
"   CommandAlias Wq wq
"   CommandAlias wQ wq
"   CommandAlias WQ! wq!
"   CommandAlias Wq! wq!
"   CommandAlias wQ! wq!
"
"   " diff shortcuts for visual mode
"   command! Dg diffget
"   command! Dp diffput
"
"   " shortcuts to open files externally and perform online searches
"   if has('mac')
"     let g:open_command = 'open'
"   elseif has('unix')
"     let g:open_command = 'xdg-open'
"   else
"     let g:open_command = 'start'
"   endif
"   command! -nargs=+ -complete=file_in_path Open call system(g:open_command.' ' . expand("<args>"))
"   command! -nargs=+ Google call system(g:open_command.' "https://www.google.com/search?q=' . expand("<args>") . '"')
"   command! -nargs=+ Dict call system(g:open_command.' "http://dict.leo.org/?lp=ende&search=' . expand("<args>") . '"')
"   command! -nargs=+ Wikipedia call system(g:open_command.' "http://en.wikipedia.org/wiki/Special:Search?search=' . expand("<args>") . '"')
"
"   " shortcuts to open tmux splits and windows
"   command! -nargs=* Mux call system('mux <args>')
"   command! -nargs=0 Shell    Mux -s -p 30
"   command! -nargs=0 Pry      Mux -s -p 30 pry
"   command! -nargs=0 RConsole Mux -s -p 30 rbenv exec rails console
"
" " }}}
"
" " Keybindings
" " {{{
"
"   " apply macros with Q (disables the default Ex mode shortcut)
"   nnoremap Q @q
"   vnoremap Q :norm @q<CR>
"
"   " shortcut for desktop clipboard
"   noremap + "+
"
"   " jump to lines with <count><Space>
"   nmap <expr> <Space> v:count ? "gg" : "<Space>"
"
"   " don't use exact searches for */#
"   noremap * g*
"   noremap # g#
"   noremap g* *
"   noremap g# #
"
"   " duplicate the selection
"   vnoremap D y`]pgv
"
"   " repeat command for each line in selection
"   xnoremap . :normal .<CR>
"
"   " shortcuts for diff
"   nnoremap du :diffupdate<CR>
"
"   " map Ctrl+C to Escape
"   inoremap <C-c> <Esc>
"   autocmd vimrc CmdWinEnter * nnoremap <buffer> <C-c> :
"
"   " indent with Tab/Shift+Tab in visual mode
"   xnoremap <Tab> >
"   xnoremap <S-Tab> <
"
"   " delete to black hole register with X
"   noremap X "_d
"   nnoremap XX "_dd
"
"   " keep cursor position when yanking in visual mode
"   xnoremap <silent><expr> y "ygv" . mode()
"
"   " reselect visual block after indent
"   xnoremap <silent> > >gv
"   xnoremap <silent> < <gv
"
"   " select pasted text
"   nmap vp `[v`]
"
"   " toggle paste mode with F12
"   set pastetoggle=<f12>
"
"   " navigate windows with Ctrl+jkhl
"   nnoremap <silent> <C-j> <C-w>j
"   nnoremap <silent> <C-k> <C-w>k
"   nnoremap <silent> <C-h> <C-w>h
"   nnoremap <silent> <C-l> <C-w>l
"
"   " alias Ctrl-v as Ctrl-q
"   noremap <C-q> <C-v>
"   inoremap <C-q> <C-v>
"   cnoremap <C-q> <C-v>
"
"   " Copy & Paste shortcuts
"   if has('mac')
"     vnoremap <D-c> "+y
"     vnoremap <D-x> "+d
"
"     map <D-v>  "+gP
"     cmap <D-v> <C-R>+
"
"     exe 'inoremap <script> <D-v>' paste#paste_cmd['i']
"     exe 'vnoremap <script> <D-v>' paste#paste_cmd['v']
"   else
"     vnoremap <C-c> "+ygv<Esc>
"     vnoremap <C-x> "+d<Esc>
"
"     noremap <C-v>  "+gP
"     cnoremap <C-v> <C-r>+
"
"     exe 'inoremap <script> <C-v>' paste#paste_cmd['i']
"     exe 'vnoremap <script> <C-v>' paste#paste_cmd['v']
"   endif
"
"   " For CTRL-v to work autoselect must be off.
"   " On Unix we have two selections, autoselect can be used.
"   if !has('unix')
"     set guioptions-=a
"   endif
"
"   " ,q and ,e - toggle quickfix window and location list
"   nnoremap <silent> ,q :call <SID>ToggleList('Quickfix List', 'c')<CR>
"   nnoremap <silent> ,e :call <SID>ToggleList('Location List', 'l')<CR>
"   function! GetBufferList() " {{{
"     redir =>buflist
"     silent! ls
"     redir END
"     return buflist
"   endfunction " }}}
"   function! s:ToggleList(bufname, pfx) " {{{
"     let buflist = GetBufferList()
"     for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
"       if bufwinnr(bufnum) != -1
"         exec(a:pfx.'close')
"         if a:pfx == 'l'
"           execute 'SyntasticReset'
"         endif
"         return
"       endif
"     endfor
"
"     if a:pfx == 'c' && !len(getqflist())
"       echohl Question
"       echo "Quickfix list is empty."
"       return
"     elseif a:pfx == 'l' && !len(getloclist(0))
"       echohl Question
"       echo "Location list is empty."
"       return
"     endif
"
"     let winnr = winnr()
"     exec(a:pfx.'open')
"     if winnr() != winnr
"       wincmd p
"     endif
"   endfunction " }}}
"
"   " resize quickfix windows to their content, or 20 lines maximum
"   autocmd vimrc FileType qf call <SID>ResizeWindow(2, 20)
"   function! s:ResizeWindow(min, max) " {{{
"     let max = min([a:max, &lines / 3])
"     execute max([a:min, min([max, line('$') + 1])]).'wincmd _'
"   endfunction " }}}
"
"   " Ctrl-c - remove highlighted search and redraw
"   nnoremap <silent> <C-c> :nohlsearch<CR>:call UncolorAllWords()<CR>:redraw!<CR>
"
"   " <count>` - switch buffers
"   nnoremap <silent><expr> ` v:count ? ":<C-u>b<C-r>=v:count<CR><CR>" : "`"
"
"   " <count>~ - delete buffers
"   nnoremap <silent><expr> ~ v:count ? ":<C-u>bd<C-r>=v:count<CR><CR>" : "~"
"
"   " ,n / ,p - next/previous buffer
"   nnoremap <silent> ,n :call SwitchBuffer(1)<CR>
"   nnoremap <silent> ,p :call SwitchBuffer(-1)<CR>
"   function! SwitchBuffer(delta)
"     let buffers = []
"     for nr in range(1, bufnr('$'))
"       if buflisted(nr) && getbufvar(nr, 'current_syntax') != 'qf'
"         call add(buffers, nr)
"       end
"     endfor
"
"     if len(buffers) == 0
"       return
"     endif
"
"     let position = index(buffers, bufnr('%')) + a:delta
"
"     if position < 0
"       let position = len(buffers) - 1
"     elseif position > len(buffers) - 1
"       let position = 0
"     endif
"
"     execute 'buffer' . buffers[position]
"   endfunction
"
"   " ,c - close current window, unless it's the only one
"   nnoremap <silent> ,c :call <SID>CloseWindow()<CR>
"   function! s:CloseWindow() " {{{
"     " get number of visible buffers
"     let buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
"
"     if winnr('$') > 1
"       if bufname('%') == '[Command Line]'
"         close
"       else
"         lclose
"         wincmd c
"       endif
"     endif
"   endfunction " }}}
"
"   " ,x - close the current buffer, keeping windows
"   nnoremap <silent> ,x :silent lclose<CR>:silent Bdelete<CR>
"
"   " ,X - close the current buffer, not keeping windows
"   nnoremap <silent> ,X :silent lclose<CR>:silent bd<CR>
"
"   " ,d - open definition in new window
"   nmap <silent> ,d <C-w>f
"
"   " ,r - reload current buffer
"   nnoremap <silent> ,r :edit<CR>
"
"   " ,R - reload vimrc
"   nnoremap <silent> ,R :runtime! vimrc gvimrc<CR>:nohlsearch<CR>
"
"   " ,s - split horizontally
"   nnoremap <silent> ,s :split<CR>
"
"   " ,v - split vertically
"   nnoremap <silent> ,v :vsplit<CR>
"
"   " ,w - write current buffer
"   nnoremap <silent> ,w :write<CR>:redraw<CR>
"
"   " ,W - write all open buffers
"   nnoremap <silent> ,W :wall<CR>:redraw<CR>
"
"   " ,$ - clear trailing whitespace
"   nnoremap <silent> ,$ :call <SID>ClearTrailingWhitespace()<CR>
"   function! s:ClearTrailingWhitespace() " {{{
"     Preserve 'silent %s/\s\s*$//e'
"     echohl Question
"     echo "Trailing whitespace cleared"
"     echohl none
"   endfunction " }}}
"
"   " ,F - toggle fold method
"   nnoremap <silent> ,F :call ToggleFoldMethod()<CR>
"   function! ToggleFoldMethod() " {{{
"     if &foldcolumn == 0
"       echohl Question
"       echomsg "Folding..."
"       echohl none
"       if &filetype == 'python'
"         setlocal foldmethod=indent
"       else
"         setlocal foldmethod=syntax
"       endif
"       setlocal foldcolumn=3
"     else
"       setlocal foldcolumn=0 foldmethod=marker
"     endif
"   endfunction " }}}
"
"   " ,g and ,G - grep the current file or path
"   nnoremap <silent> ,g :call <SID>GrepWrapper('%')<CR>
"   nnoremap <silent> ,G :call <SID>GrepWrapper('.')<CR>
"   function! s:GrepWrapper(path) " {{{
"     if a:path == '%' && empty(expand('%'))
"       echo "Can't grep unsaved file."
"       return
"     endif
"
"     echohl Question
"     let pattern = substitute(input("Grep " . (a:path == '%' ? 'buffer' : 'recursive') . ": /", expand('<cword>')), '"', '\"', '')
"
"     if !empty(pattern)
"       echohl Question
"       echo "/ searching..."
"       execute 'silent! grep ' . shellescape(pattern) . ' ' . a:path . ' /dev/null'
"       redraw!
"
"       let matches = len(getqflist())
"       if matches > 0
"         echo matches . " " . (matches == 1 ? "match" : "matches") . " found"
"       else
"         echohl WarningMsg
"         echo "Pattern not found: " . pattern
"       endif
"     endif
"
"     echohl None
"   endfunction " }}}
"
"   " ,N - toggle line numbers
"   nnoremap <silent> ,N :call <SID>ToggleLineNumbers()<CR>
"   function! s:ToggleLineNumbers() " {{{
"     if &number
"       set nonumber norelativenumber
"     else
"       set number norelativenumber
"     endif
"   endfunction " }}}
"
"   " F4 / F5 - change window height
"   nnoremap <silent> <F4> <C-w>+
"   imap <silent> <F4> <C-o><F4>
"   nnoremap <silent> <F5> <C-w>-
"   imap <silent> <F5> <C-o><F5>
"
"   " F6 / F7 - change window width
"   nnoremap <silent> <F6> <C-w>>
"   imap <silent> <F6> <C-o><F6>
"   nnoremap <silent> <F7> <C-w><
"   imap <silent> <F7> <C-o><F7>
"
" " }}}
"
" " Plugin Settings
" " {{{
"
"   " json {{{
"   let g:vim_json_syntax_conceal = (&conceallevel > 0)
"   let g:vim_json_syntax_concealcursor = &concealcursor
"   " }}}
"
"   " devicons {{{
"   let g:webdevicons_enable_airline_tabline = 0
"   " }}}
"
"   " tagbar {{{
"   let g:tagbar_autoclose = 1
"   let g:tagbar_compact = 1
"   let g:tagbar_previewwin_pos = 'rightbelow'
"
"   nnoremap <silent> ,t :TagbarToggle<CR>
"   " }}}
"
"   " pasta {{{
"   let g:pasta_disabled_filetypes = [ 'python', 'coffee', 'markdown', 'yaml', 'slim', 'tagbar' ]
"   " }}}
"
"   " diff-enhanced {{{
"   autocmd vimrc VimEnter * EnhancedDiff histogram
"   " }}}
"
"   " man {{{
"   runtime ftplugin/man.vim
"   " }}}
"
"   " rails {{{
"   hi! link rubyRailsARMethod Statement
"   " }}}
"
"   " incsearch {{{
"   let g:incsearch#consistent_n_direction = 1
"   let g:incsearch#emacs_like_keymap = 1
"
"   map /  <Plug>(incsearch-forward)
"   map ?  <Plug>(incsearch-backward)
"   map g/ <Plug>(incsearch-stay)
"   " }}}
"
"   " interesting-words {{{
"   nnoremap <silent> <Space> :call InterestingWords('n')<CR>
"   " }}}
"
"   " javascript-libraries-syntax {{{
"   let g:used_javascript_libs = 'jquery,requirejs'
"   " }}}
"
"   " unimpaired {{{
"   xmap <silent> <C-j> ]egv=gv
"   xmap <silent> <C-k> [egv=gv
"   " }}}
"
"   " test {{{
"   let g:test#strategy = 'dispatch'
"
"   nnoremap <silent> ,!  :TestFile<CR>
"   nnoremap <silent> ,!! :TestNearest<CR>
"   " }}}
"
"   " ragtag {{{
"   let g:ragtag_global_maps = 1
"
"   imap <C-]> <C-x>/
"   autocmd vimrc User Ragtag silent! iunmap <buffer> <C-v>%
"   autocmd vimrc User Ragtag silent! iunmap <buffer> <C-v>&
"   " }}}
"
"   " rooter {{{
"   let g:rooter_manual_only = 1
"   let g:rooter_change_directory_for_non_project_files = 0
"   let g:rooter_use_lcd = 1
"   let g:rooter_silent_chdir = 1
"   let g:rooter_patterns = ['Gemfile', 'package.json', 'bower.json', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']
"
"   if index(g:pathogen_disabled, 'rooter') == -1
"     autocmd vimrc BufEnter * if !isdirectory(expand('%')) | Rooter
"   endif
"   " }}}
"
"   " matchparen {{{
"   let g:matchparen_timeout = 50
"   let g:matchparen_insert_timeout = 50
"   " }}}
"
"   " cycle {{{
"   autocmd vimrc FileType *
"     \ call AddCycleGroup('global', [ 'return', 'break', 'continue' ])
"   autocmd vimrc FileType ruby
"     \ call AddCycleGroup('global', [ 'return', 'break', 'continue', 'next', 'retry' ])
"   autocmd vimrc FileType sh
"     \ call AddCycleGroup('sh', [ 'if', 'elif', 'else', 'fi' ])
"   autocmd vimrc FileType sh
"     \ call AddCycleGroup('sh', [ 'do', 'then' ])
"   autocmd vimrc FileType javascript,coffee
"     \ call AddCycleGroup([ 'javascript', 'coffee' ], [ 'addClass', 'removeClass' ])
"
"   autocmd vimrc FileType *
"     \ call AddCycleGroup('global', [ 'debit', 'credit' ])
"   " }}}
"
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
"   " netrw {{{
"   let g:netrw_silent = 1
"   let g:netrw_ftpmode = 'ascii'
"   let g:netrw_ftp_cmd = 'ftp -p'
"   let g:netrw_longlist = 1
"   let g:netrw_winsize = 40
"   let g:netrw_altv = 1
"   let g:DrChipTopLvlMenu = 'Plugins.'
"   if has('unix') && exists("$DISPLAY")
"     let g:netrw_browsex_viewer = 'xdg-open'
"   endif
"   " }}}
"
"   " syntastic {{{
"   nnoremap <silent>,l :SyntasticToggleMode<CR>
"   nnoremap <silent>,L :SyntasticCheck<CR>
"
"   let g:syntastic_check_on_open = 0
"   let g:syntastic_enable_highlighting = 0
"   let g:syntastic_echo_current_error = 0
"
"   let g:syntastic_javascript_checkers = [ 'jshint', 'jscs' ]
"   let g:syntastic_python_checkers = [ 'python' ]
"
"   " let g:syntastic_ruby_checkers = [ 'mri' ]
"   " let g:syntastic_sh_checkers = [ 'sh' ]
"   " let g:syntastic_slim_checkers = []
"
"   let g:syntastic_puppet_puppetlint_args = '--no-documentation-check'
"   let g:syntastic_ruby_rubocop_exec = expand('~/.rbenv/shims/rubocop')
"   let g:syntastic_ruby_rubocop_args = '-D'
"   let g:syntastic_ruby_slimrb_exec = expand('~/.rbenv/shims/slimrb')
"   let g:syntastic_sass_sass_exec = expand('~/.rbenv/shims/sass')
"   let g:syntastic_sass_sass_args = '-I .'
"   let g:syntastic_scss_sass_exec = expand('~/.rbenv/shims/sass')
"   let g:syntastic_scss_sass_args = '-I .'
"   let g:syntastic_sh_shellcheck_exec = 'shellcheck'
"   let g:syntastic_sh_shellcheck_args = '-e 2064,2086,2139,2155'
"
"   " autocmd vimrc BufRead */app/views/**/*.js.coffee
"   "   \ let b:syntastic_coffee_checkers = []
"   " autocmd vimrc BufEnter *.coffee
"   "   \ let g:syntastic_coffee_checkers = [ 'coffee', 'coffeelint' ]
"
"   if !&diff
"     let g:syntastic_auto_loc_list = 1
"     let g:syntastic_auto_jump = 0
"   endif
"   " }}}
"
"   " neocomplete {{{
"   if index(g:pathogen_disabled, 'neocomplete') == -1
"     let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
"     let g:neocomplete#enable_at_startup = 1
"     let g:neocomplete#enable_auto_select = 1
"     let g:neocomplete#enable_smart_case = 1
"     let g:neocomplete#auto_completion_start_length = 2
"
"     " increase limit for tag cache files
"     let g:neocomplete#sources#tags#cache_limit_size = 16777216 " 16MB
"
"     " fuzzy completion breaks dot-repeat more noticeably
"     " https://github.com/Shougo/neocomplete.vim/issues/332
"     let g:neocomplete#enable_fuzzy_completion = 0
"
"     " always use completions from all buffers
"     if !exists('g:neocomplete#same_filetypes')
"       let g:neocomplete#same_filetypes = {}
"     endif
"     let g:neocomplete#same_filetypes._ = '_'
"
"     " enable omni-completion for Ruby and PHP
"     call neocomplete#util#set_default_dictionary(
"           \'g:neocomplete#sources#omni#input_patterns', 'ruby',
"           \'[^. *\t]\.\h\w*\|\h\w*::\w*')
"     call neocomplete#util#set_default_dictionary(
"           \'g:neocomplete#sources#omni#input_patterns',
"           \'php',
"           \'[^. \t]->\h\w*\|\h\w*::\w*')
"
"     " disable for Python
"     call neocomplete#util#set_default_dictionary(
"           \'g:neocomplete#sources#omni#input_patterns',
"           \'python',
"           \'')
"
"     " from neocomplete.txt:
"     " ---------------------
"
"     " Plugin key-mappings.
"     inoremap <expr> <C-g> neocomplete#undo_completion()
"     inoremap <expr> <C-l> neocomplete#complete_common_string()
"
"     " Recommended key-mappings.
"     " <CR>: cancel popup and insert newline.
"     inoremap <silent> <CR> <C-r>=neocomplete#smart_close_popup()<CR><CR>
"     " <TAB>: completion.
"     inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
"     " <C-h>, <BS>: close popup and delete backword char.
"     inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
"     inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"
"     inoremap <expr> <C-y> neocomplete#close_popup()
"     inoremap <expr> <C-e> neocomplete#cancel_popup()
"   endif
"   " }}}
"
"   " airline {{{
"   if index(g:pathogen_disabled, 'airline') == -1
"     if &t_Co > 8
"       let g:airline_theme = 'desertink'
"     else
"       let g:airline_theme = 'kalisi'
"     endif
"
"     let g:airline_inactive_collapse = 0
"     let g:airline_detect_paste = 0
"     let g:airline_detect_iminsert = 0
"
"     let g:airline#extensions#hunks#enabled = 0
"     let g:airline#extensions#quickfix#enabled = 0
"     let g:airline#extensions#syntastic#enabled = 0
"     let g:airline#extensions#whitespace#enabled = 0
"
"     let g:airline#extensions#tagbar#enabled = 1
"
"     let g:airline#extensions#tabline#enabled = 1
"     let g:airline#extensions#tabline#excludes = [ 'tagbar' ]
"     let g:airline#extensions#tabline#formatter = 'unique_tail'
"     let g:airline#extensions#tabline#buffer_nr_show = 1
"     let g:airline#extensions#tabline#buffer_min_count = 2
"
"     if has('gui_running') || exists('$POWERLINE_FONT')
"       let g:airline_powerline_fonts = 1
"
"       let g:airline#extensions#tabline#left_sep = ''
"       let g:airline#extensions#tabline#left_alt_sep = ''
"     else
"       " unicode symbols
"       let g:airline_left_sep = '»'
"       let g:airline_left_sep = '▶'
"       let g:airline_right_sep = '«'
"       let g:airline_right_sep = '◀'
"
"       if !exists('g:airline_symbols')
"         let g:airline_symbols = {}
"       endif
"
"       let g:airline_symbols.branch = '@'
"       let g:airline_symbols.linenr = ''
"
"       let g:airline#extensions#tabline#left_sep = g:airline_left_sep
"       let g:airline#extensions#tabline#left_alt_sep = ' '
"     endif
"
"     let g:airline_mode_map = {
"       \ '__' : '#',
"       \ 'n'  : 'n',
"       \ 'i'  : 'i',
"       \ 'R'  : 'r',
"       \ 'v'  : 'v',
"       \ 'V'  : 'V',
"       \ 'c'  : 'c',
"       \ "\026" : 'v•b',
"       \ 's'  : 's',
"       \ 'S'  : 'S',
"       \ "\023" : 's•b',
"       \ }
"
"     let g:airline#extensions#default#section_truncate_width = {
"       \ 'b': 80
"     \ }
"
"     " overwrite sections after airline has loaded
"     autocmd vimrc VimEnter * call s:AirlineOverrides()
"
"     function! s:AirlineOverrides()
"       " hide tag in small windows
"       call airline#parts#define_minwidth('tagbar', 100)
"
"       " add space after readonly symbol
"       let g:airline_symbols.readonly .= ' '
"
"       " show file directory separately from file name
"       call airline#parts#define_raw('file', '%t%m')
"       call airline#parts#define_raw('filepath', '%#airline_filepath#[%<%{ProjectFilepath(0)}]')
"       let g:airline_section_c = airline#section#create(['file', g:airline_symbols.space, 'readonly', 'filepath'])
"
"       hi airline_filepath term=bold cterm=bold ctermfg=244 ctermbg=235 gui=bold guifg=#999999 guibg=#303030
"       hi airline_filepath_inactive term=bold cterm=bold ctermfg=238 ctermbg=235 gui=bold guifg=#555555 guibg=#303030
"       hi airline_filepath_insert term=bold cterm=bold ctermfg=238 ctermbg=135 gui=bold guifg=#555555 guibg=#303030
"
"       " switch filetype and format/encoding, and only show
"       " file format and encoding if it's not the default
"       let g:airline_section_x = airline#section#create([
"         \ "%{substitute(airline#parts#ffenc(), '\\(^utf-8\\|\\[unix\\]$\\)', '', 'g')}"
"       \ ])
"       let g:airline_section_y = airline#section#create_right(['tagbar', 'filetype'])
"
"       " don't show position percentage
"       let g:airline_section_z = airline#section#create(['windowswap', 'linenr', ':%v'])
"     endfunction
"   endif
"   " }}}
"
"   " unite {{{
"   if index(g:pathogen_disabled, 'unite') == -1
"     let g:unite_data_directory = '~/.vim/tmp/unite'
"     let g:unite_source_rec_max_cache_files = 5000
"     let g:unite_source_file_mru_long_limit = 5000
"
"     " speed up recursive file searches
"     if s:has_ag
"       let g:unite_source_rec_async_command = 'ag -l -g "" --nocolor'
"       let g:unite_source_grep_command = 'ag'
"       let g:unite_source_grep_default_opts = '--smart-case --nogroup --nocolor --line-numbers'
"       let g:unite_source_grep_recursive_opt = ''
"     endif
"
"     " shortcut for bookmarks
"     command! -nargs=? -complete=file Bookmark UniteBookmarkAdd <args>
"
"     " sort file results by length
"     call unite#custom#source('file', 'sorters', 'sorter_length')
"     call unite#custom#source('file_rec/async', 'sorters', 'sorter_length')
"
"     " sort buffers by number
"     call unite#custom#source('buffer', 'sorters', 'sorter_reverse')
"
"     " settings for buffers
"     let g:unite_source_buffer_time_format = '(%Y-%m-%d %H:%M:%S) '
"
"     " settings for neomru
"     let g:neomru#file_mru_limit = 10
"     let g:neomru#time_format = '(%Y-%m-%d %H:%M:%S) '
"     let g:neomru#file_mru_ignore_pattern = 'COMMIT_EDITMSG'
"
"     " map our keys in all Unite buffers
"     autocmd vimrc FileType unite call <SID>unite_buffer_mappings()
"     function! s:unite_buffer_mappings() " {{{
"       " use Tab to run the default action
"       nmap <silent><buffer> <Tab> <Plug>(unite_do_default_action)
"       imap <silent><buffer> <Tab> <Plug>(unite_do_default_action)
"
"       " use ,a to show all actions
"       nmap <silent><buffer> ,a <Plug>(unite_choose_action)
"       imap <silent><buffer> ,a <Plug>(unite_choose_action)
"
"       " use ; to toggle insert mode
"       nmap <silent><buffer> ; i
"       inoremap <silent><buffer> ; <Esc>
"
"       " use ,s and ,v to open the selection in horizontal/vertical splits
"       imap <silent><buffer><expr> ,s unite#do_action('split')
"       imap <silent><buffer><expr> ,v unite#do_action('vsplit')
"
"       " use ' to start quick-match mode
"       nmap <silent><buffer> ' <Plug>(unite_quick_match_default_action)
"       imap <silent><buffer> ' <Plug>(unite_quick_match_default_action)
"
"       " use C-c to close Unite
"       nmap <silent><buffer> <C-c> <Plug>(unite_exit)
"       imap <silent><buffer> <C-c> <Plug>(unite_exit)
"
"       " use C-n and C-p to move between lines in normal mode too
"       noremap <silent><buffer> <C-n> j
"       noremap <silent><buffer> <C-p> k
"     endfunction " }}}
"
"     " wrapper for default Unite arguments
"     function! UniteWrapper(action, arguments)
"       return ":\<C-u>silent! Unite -no-split -no-resize -toggle " . a:action . " " . a:arguments . "\<CR>"
"     endfunction
"
"     " ,f - show files in the current working directory and project tree
"     nnoremap <silent><expr> ,f UniteWrapper('file' . (empty(expand('%')) ? '' : ':'.expand('%:.:h')) . ' file_rec/async:!' . (empty(expand('%')) ? '' : ':'.expand('%:.:h')) . ' file/new' . (empty(expand('%')) ? '' : ':'.expand('%:.:h')), '-buffer-name=unite-files -start-insert')
"
"     " ,<Space> - show Git changes and recently edited files
"     nnoremap <silent><expr> ,<Space> UniteWrapper((empty(system('git rev-parse --is-inside-work-tree 2>/dev/null')) ? '' : 'giti/status ') . 'file_mru:all', '-buffer-name=unite-changes -start-insert')
"
"     " ,b - show open buffers
"     nnoremap <silent><expr> ,b UniteWrapper('buffer', '-buffer-name=unite-buffers -start-insert')
"
"     " ,B - search bundle
"     nnoremap <silent><expr> ,B UniteWrapper(join(map(split(glob('{.bundle/ruby/*/{gems,bundler/gems},node_modules,vim/bundle,.vim/bundle}'), '\n'), '"file_rec/async:" . v:val'), ' '), '-buffer-name=unite-bundle -start-insert')
"
"     " ,y - show yank history
"     let g:unite_source_history_yank_enable = 1
"     nnoremap <silent><expr> ,y UniteWrapper('history/yank', '-buffer-name=unite-yank-history')
"
"     " ,T - show tags
"     nnoremap <silent><expr> ,T UniteWrapper('tag', '-start-insert')
"
"     " run ,<Space> on startup if no arguments were given
"     " au VimEnter *
"     "   \ if !argc() && (line2byte('$') == -1) && (v:progname =~? '^[gm]\=vim\%[\.exe]$') |
"     "   \   execute "normal , " |
"     "   \ endif
"   endif
"   " }}}
"
" " }}}

for fpath in split(globpath('~/.vim/rc', '*.vim'), '\n')
    exe 'source' fpath
endfor
