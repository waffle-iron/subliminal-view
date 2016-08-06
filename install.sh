#!/usr/bin/env bash


function echospaced() {
    printf "\n# ${1}\n"
}

echospaced "Generating icons ..."
convert -verbose -background None subliminal-vim.svg subliminal-vim.png

echospaced "Creating folders ..."
mkdir -vp ${HOME}/.subliminal-vim/recovery
mkdir -vp ${HOME}/.subliminal-vim/backups
mkdir -vp ${HOME}/.subliminal-vim/undo
mkdir -vp ${HOME}/.local/share/fonts
mkdir -vp ${HOME}/.local/share/applications
mkdir -vp ${HOME}/.local/share/icons
mkdir -vp ${HOME}/.local/bin

echospaced "Copying content ..."
cp -vfs ${HOME}/.subliminal-vim/app/fonts/* ${HOME}/.local/share/fonts/
cp -vfs ${HOME}/.subliminal-vim/app/subliminal-vim.png ${HOME}/.local/share/icons/
cp -vfs ${HOME}/.subliminal-vim/app/subliminal-vim.desktop ${HOME}/.local/share/applications/
cp -vfs ${HOME}/.subliminal-vim/app/subliminal-vim.sh ${HOME}/.local/bin/subliminal-vim

echospaced "Updating font cache ..."
fc-cache -vr ${HOME}/.local/share/fonts

echospaced "Configuring executables ..."
if [ ! -f ${HOME}/.bashrc ]; then
	touch ${HOME}/.bashrc
fi

if ! grep -q 'PATH="${PATH}:${HOME}/.local/bin"' ${HOME}/.bashrc; then
    echo 'PATH="${PATH}:${HOME}/.local/bin"' >> ${HOME}/.bashrc
fi