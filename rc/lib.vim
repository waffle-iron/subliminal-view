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
