set nocompatible
filetype plugin on
filetype indent on

execute pathogen#infect()

for fpath in split(globpath('~/.vim/rc', '*.vim'), '\n')
    exe 'source' fpath
endfor
