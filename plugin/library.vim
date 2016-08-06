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

function! EchoSyntasticText()
    if !exists('b:syntastic_private_messages')
        let b:syntastic_private_messages = {}
    endif

    if has_key(b:syntastic_private_messages, line('.'))
        return b:syntastic_private_messages[line('.')][0].text
    endif

    return expand('%F%m')
endfunction


autocmd User AirlineAfterInit call AirlineInit()

function! AirlineInit()
    let g:airline_section_a = airline#section#create_left(['branch'])
    let g:airline_section_b = airline#section#create_left(['hunks'])
    let g:airline_section_warning = airline#section#create_left(['whitespace'])
    let g:airline_section_error = airline#section#create_left(['syntastic'])
    let g:airline_section_c = airline#section#create_left(['%{EchoSyntasticText()}'])
    let g:airline_section_x = airline#section#create_right(['readonly', 'filetype'])
    let g:airline_section_y = airline#section#create_right(['ffenc'])
    let g:airline_section_z = airline#section#create_right(['Line %3l, Column %3v'])
endfunction


function! CloseFile()
    if &mod
        let l:message = 'Do you want to save changes before closing?'
        let l:windowcmd = 'zenity --question --no-wrap'
        let l:windowcmd .= ' --text '''.l:message.''' '
        let l:windowcmd .= ' --extra-button "Close without saving"'
        let l:windowcmd .= ' --ok-label "Save"'
        let l:windowcmd .= ' --cancel-label "Cancel"'
        let l:windowcmd .= ' --title "Save?" --modal'
        let l:windowcmd .= ' --window-icon ~/.local/share/icons/subliminal-vim.png'
        let l:windowcmd .= ' 2>/dev/null'
        let l:question = system(l:windowcmd)

        " If empty, user chose Save or Cancel
        if empty(l:question)
            " If v:shell_error == 0, user chose Save
            if !v:shell_error
                call SaveFile()
            else
                return
            endif
        endif
    endif

    execute ':bp!'
    execute ':bw!#'
    execute ':startinsert!'
endfunction


function! SaveFile()
    if empty(expand('%:t'))
        call SaveFileAs()
    else
        execute ':w!'
        execute ':startinsert!'
    endif
endfunction


function! SaveFileAs()
    let l:windowcmd = 'zenity --file-selection'
    let l:windowcmd .= ' --save'
    let l:windowcmd .= ' --title "Enter filename" --modal'
    let l:windowcmd .= ' --window-icon ~/.local/share/icons/subliminal-vim.png'
    let l:windowcmd .= ' 2>/dev/null | xargs printf'
    let l:savefile = system(l:windowcmd)

    if !empty(glob(l:savefile))
        let l:filename = split(l:savefile, '/')[-1]
        let l:folder = split(l:savefile, '/')[-2]
        let l:existsmessage = 'A file named "'.l:filename.'" already exists'
        let l:existsmessage .= ' in "'.l:folder.'".\n\n'
        let l:existsmessage .= ' Do you want to replace it?'
        let l:windowcmd = 'zenity --question --no-wrap'
        let l:windowcmd .= ' --text '''.l:existsmessage.''' '
        let l:windowcmd .= ' --title "Replace?" --modal'
        let l:windowcmd .= ' --window-icon ~/.local/share/icons/subliminal-vim.png'
        let l:windowcmd .= ' 2>/dev/null'
        let l:question = system(l:windowcmd)
    endif

    if !v:shell_error
        execute ':w! '.l:savefile
    endif
    execute ':startinsert!'
endfunction

function! OpenFile()
    let l:windowcmd = 'zenity --file-selection'
    let l:windowcmd .= ' --title "Open file" --modal'
    let l:windowcmd .= ' --window-icon ~/.local/share/icons/subliminal-vim.png'
    let l:windowcmd .= ' 2>/dev/null'
    let l:openfile = system(l:windowcmd)
    execute ':e '.l:openfile
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! SearchProject() range
    let l:pattern = input('Search (project): ')
    let l:pattern = escape(l:pattern, '\\/.*$^~[]<>')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    call CmdLine("Ag! \"" . l:pattern . "\"<CR>" )

endfunction

function! VSearchFile(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]<>')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! VSearchReplaceFile() range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]<>')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    let arg = input('Replace with (file): ')
    call CmdLine("%s" . '/'. l:pattern . '/' . arg . '/g<CR>')

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" show the project name and relative path to the current file
function! ProjectFilePath(short)
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
endfunction

function! NERDTreeExtendHeight()
    let l:lastlinec = getline('$')
    let l:curlinen = line('.')
    let l:spacetoken = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    let l:texttoken = "# NERDTree ------------------------------------------"
    let l:finaltoken = spacetoken . spacetoken . texttoken

    if (&ft ==# 'nerdtree') && (l:lastlinec !=# l:texttoken)
        setlocal modifiable
        $put = l:finaltoken
        setlocal nomodifiable
        execute "normal ".l:curlinen."G"
    endif
endfunction

function! NERDTreePaint()
    if &ft ==# 'nerdtree'
        highlight ColorColumn ctermbg=254
        highlight CursorLine ctermfg=0 cterm=bold
        let &colorcolumn = join(range(1,300),",")
    else
        highlight CursorLine ctermfg=NONE cterm=NONE
    endif
endfunction

function! NextNormalWindow()
  let l:i = 1
  while(l:i <= winnr('$'))
    let l:buf = winbufnr(l:i)

    " skip unlisted buffers
    if buflisted(l:buf) == 0
      let l:i = l:i + 1
      continue
    endif

    " skip un-modifiable buffers
    if getbufvar(l:buf, '&modifiable') != 1
      let l:i = l:i + 1
      continue
    endif

    " skip temporary buffers with buftype set
    if empty(getbufvar(l:buf, "&buftype")) != 1
      let l:i = l:i + 1
      continue
    endif

    return l:i
  endwhile
  return -1
endfunction

function! IsCurrentWindowNERDTree()
  return exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr()
endfunction

function! NERDTreeUnfocus()
  if IsCurrentWindowNERDTree()
    let l:winNum = NextNormalWindow()
    if l:winNum != -1
      exec l:winNum.'wincmd w'
    else
      wincmd w
    endif
  endif
endfunction


set colorcolumn=

highlight NERDTreePart ctermfg=238
highlight NERDTreePartFile ctermfg=238
highlight NERDTreeExecFile ctermfg=238
highlight NERDTreeDirSlash ctermfg=238
highlight NERDTreeBookmarksHeader ctermfg=238
highlight NERDTreeBookmarksLeader ctermfg=238
highlight NERDTreeBookmarkName ctermfg=238
highlight NERDTreeBookmark ctermfg=238
highlight NERDTreeHelp ctermfg=238
highlight NERDTreeHelpKey ctermfg=238
highlight NERDTreeHelpCommand ctermfg=238
highlight NERDTreeHelpTitle ctermfg=238
highlight NERDTreeToggleOn ctermfg=238
highlight NERDTreeToggleOff ctermfg=238
highlight NERDTreeLinkTarget ctermfg=238
highlight NERDTreeLinkFile ctermfg=238
highlight NERDTreeLinkDir ctermfg=238
highlight NERDTreeDir ctermfg=238
highlight NERDTreeUp ctermfg=238
highlight NERDTreeFile ctermfg=238
highlight NERDTreeCWD ctermfg=238
highlight NERDTreeOpenable ctermfg=238
highlight NERDTreeClosable ctermfg=238
highlight NERDTreeIgnore ctermfg=238
highlight NERDTreeRO ctermfg=238
highlight NERDTreeBookmark ctermfg=238
highlight NERDTreeFlags ctermfg=238
highlight NERDTreeCurrentNode ctermfg=238

if isdirectory(g:plugs['nerdtree'].dir)
    autocmd FileType nerdtree setlocal nolist
    autocmd VimEnter * NERDTree | call NERDTreeExtendHeight() | call NERDTreePaint() | call NERDTreeUnfocus() | call NERDTreePaint()
    autocmd CursorMoved,WinEnter,BufWinEnter,BufEnter,WinLeave,BufWinLeave,BufLeave * call NERDTreeExtendHeight() | call NERDTreePaint()
    autocmd WinEnter,BufWinEnter,BufEnter * setlocal cursorline
    autocmd WinLeave,BufWinLeave,BufLeave * setlocal nocursorline
endif

if !exists('*AutoPlugInstall')
    function! AutoPlugInstall()
        if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
            PlugInstall | qall
            let l:question = system('bash -c subliminal-vim')
        endif
    endfunction
endif

if exists(':PlugInstall')
    augroup auto_plug_install
        autocmd!
        autocmd VimEnter * call AutoPlugInstall()
    augroup END
endif
