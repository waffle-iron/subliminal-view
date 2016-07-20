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

