let g:airline_theme='murmur'
let g:airline_powerline_fonts=1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


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
"     " vim-airline {
"         " Set configuration options for the statusline plugin vim-airline.
"         " Use the powerline theme and optionally enable powerline symbols.
"         " To use the symbols , , , , , , and .in the statusline
"         " segments add the following to your .vimrc.before.local file:
"         "   let g:airline_powerline_fonts=1
"         " If the previous symbols do not render for you then install a
"         " powerline enabled font.
"
"         " See `:echo g:airline_theme_map` for some more choices
"         " Default in terminal vim is 'dark'
"         if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
"             if !exists('g:airline_theme')
"                 let g:airline_theme = 'solarized'
"             endif
"             if !exists('g:airline_powerline_fonts')
"                 " Use the default set of separators with a few customizations
"                 let g:airline_left_sep='›'  " Slightly fancier than '>'
"                 let g:airline_right_sep='‹' " Slightly fancier than '<'
"             endif
"         endif
"     " }
"
"
