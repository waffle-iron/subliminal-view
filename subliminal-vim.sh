#!/usr/bin/env bash

export XENVIRONMENT="${HOME}/.subliminal-vim/Xresources"

urxvt -name subliminal-vim -e bash -c \
    "stty -ixon susp undef; \
    vim -u ${HOME}/.subliminal-vim/settings/main.vim $@" &
