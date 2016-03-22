" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc



autocmd VimEnter * call s:actionForOpen()
function! s:actionForOpen()
	let filename = expand('%:t')
	NERDTree
	if !empty(filename)
		wincmd l
	endif
endfunction

autocmd BufCreate * call s:addingNewTab()
function! s:addingNewTab()
	let filename = expand('%:t')
	if winnr('$') < 2 && exists('t:NERDTreeBufName') == 0
		NERDTree
		if !empty(filename)
			wincmd l
		endif
	endif
endfunction

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			endif
		endif
	endif
endfunction


" function! CmdLine(str)
"     exe "menu Foo.Bar :" . a:str
"     emenu Foo.Bar
"     unmenu Foo
" endfunction
"
" function! VisualSelection(direction, extra_filter) range
"     let l:saved_reg = @"
"     execute "normal! vgvy"
"
"     let l:pattern = escape(@", '\\/.*$^~[]')
"     let l:pattern = substitute(l:pattern, "\n$", "", "")
"
"     if a:direction == 'b'
"         execute "normal ?" . l:pattern . "^M"
"     elseif a:direction == 'gv'
"         call CmdLine("Ag \"" . l:pattern . "\" " )
"     elseif a:direction == 'replace'
"         call CmdLine("%s" . '/'. l:pattern . '/')
"     elseif a:direction == 'f'
"         execute "normal /" . l:pattern . "^M"
"     endif
"
"     let @/ = l:pattern
"     let @" = l:saved_reg
" endfunction
"
"
" " Returns true if paste mode is enabled
" function! HasPaste()
"     if &paste
"         return 'PASTE MODE  '
"     endif
"     return ''
" endfunction
"
" " Don't close window, when deleting a buffer
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
"
  " show the project name and relative path to the current file
  function! ProjectFilepath(short) " {{{
    let l:path = fnamemodify(expand('%'), ':p:h')
    let l:root = getcwd()

    let l:root = substitute(l:path, '^' . l:root . '/', '', '')
    let l:root = substitute(l:root, '^' . $HOME, '~', '')

    if exists('b:git_dir')
      let l:root = substitute(l:root, '^' . b:git_dir, '', '')
      let l:project = fnamemodify(b:git_dir, ':h:t')

      " only return project name
      if a:short || winwidth(0) < 60
        return l:project
      endif

      " otherwise also add the path
      if fnamemodify(b:git_dir, ':h') == l:root
        let l:root = l:project
      else
        let l:root .= ' @ ' . l:project
      endif
    endif

    return l:root
  endfunction " }}}

  " show recent log entries in commit messages
  function! s:EnhanceCommitMessage()
    " avoid line wrapping
    let textwidth = &textwidth
    let &textwidth = 0

    " return if log entries were already added
    normal gg0
    if search('^# Latest commits:$')
      return
    endif

    if !search('^# Please enter the commit message')
      return
    endif

    normal V
    call search('^# Changes to be committed:$')
    normal kkd

    normal O# Latest commits:

    let command = 'git log -n 5 --no-color --no-decorate --pretty=%s'
    for line in split(system(command), '\n')
      execute 'normal o#  - ' . line
    endfor

    normal o#
    normal gg0

    " insert new line for empty commit messages
    if search('^# Latest commits:$', 'n') == 2
      normal O
      startinsert
    endif

    let &textwidth = textwidth
  endfunction
" autocmd vimrc FileType gitcommit call <SID>EnhanceCommitMessage()


" Make VIM remember position in file after reopen
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Autocommands
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()




" Commands
command! Bclose call <SID>BufcloseCloseIt()

"     " Initialize directories {
"     function! InitializeDirectories()
"         let parent = $HOME
"         let prefix = 'vim'
"         let dir_list = {
"                     \ 'backup': 'backupdir',
"                     \ 'views': 'viewdir',
"                     \ 'swap': 'directory' }
"
"         if has('persistent_undo')
"             let dir_list['undo'] = 'undodir'
"         endif
"
"         " To specify a different directory in which to place the vimbackup,
"         " vimviews, vimundo, and vimswap files/directories, add the following to
"         " your .vimrc.before.local file:
"         "   let g:spf13_consolidated_directory = <full path to desired directory>
"         "   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
"         if exists('g:spf13_consolidated_directory')
"             let common_dir = g:spf13_consolidated_directory . prefix
"         else
"             let common_dir = parent . '/.' . prefix
"         endif
"
"         for [dirname, settingname] in items(dir_list)
"             let directory = common_dir . dirname . '/'
"             if exists("*mkdir")
"                 if !isdirectory(directory)
"                     call mkdir(directory)
"                 endif
"             endif
"             if !isdirectory(directory)
"                 echo "Warning: Unable to create backup directory: " . directory
"                 echo "Try: mkdir -p " . directory
"             else
"                 let directory = substitute(directory, " ", "\\\\ ", "g")
"                 exec "set " . settingname . "=" . directory
"             endif
"         endfor
"     endfunction
"     call InitializeDirectories()
"     " }
"
"     " Initialize NERDTree as needed {
"     function! NERDTreeInitAsNeeded()
"         redir => bufoutput
"         buffers!
"         redir END
"         let idx = stridx(bufoutput, "NERD_tree")
"         if idx > -1
"             NERDTreeMirror
"             NERDTreeFind
"             wincmd l
"         endif
"     endfunction
"     " }
"
"     " Strip whitespace {
"     function! StripTrailingWhitespace()
"         " Preparation: save last search, and cursor position.
"         let _s=@/
"         let l = line(".")
"         let c = col(".")
"         " do the business:
"         %s/\s\+$//e
"         " clean up: restore previous search history, and cursor position
"         let @/=_s
"         call cursor(l, c)
"     endfunction
"     " }
"
"     " Shell command {
"     function! s:RunShellCommand(cmdline)
"         botright new
"
"         setlocal buftype=nofile
"         setlocal bufhidden=delete
"         setlocal nobuflisted
"         setlocal noswapfile
"         setlocal nowrap
"         setlocal filetype=shell
"         setlocal syntax=shell
"
"         call setline(1, a:cmdline)
"         call setline(2, substitute(a:cmdline, '.', '=', 'g'))
"         execute 'silent $read !' . escape(a:cmdline, '%#')
"         setlocal nomodifiable
"         1
"     endfunction
"
"     command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
"     " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
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
""
"     autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
"     "autocmd FileType go autocmd BufWritePre <buffer> Fmt
"     autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
"     autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
"     " preceding line best in a plugin but here for now.
"
"     autocmd BufNewFile,BufRead *.coffee set filetype=coffee
"
"     " Workaround vim-commentary for Haskell
"     autocmd FileType haskell setlocal commentstring=--\ %s
"     " Workaround broken colour highlighting in Haskell
"     autocmd FileType haskell,rust setlocal nospell
"     " Instead of reverting the cursor to the last position in the buffer, we
     " set it to the first line when editing a git commit message
     au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" automatically open quickfix window after commands that modify the quickfix list
"autocmd vimrc QuickFixCmdPost *grep* if len(getqflist()) | copen | endif
"
" highlight trailing whitespace
"autocmd vimrc VimEnter,Colorscheme * highlight Whitespace ctermbg=235 guibg=#333333
"autocmd vimrc VimEnter,Colorscheme * match Whitespace /[^ \t]\s\+$/



