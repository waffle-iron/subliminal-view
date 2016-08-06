#!/usr/bin/env bash


USER="$( id -un )"
TEMPDIR="$( mktemp -d )"
APTGET="$( which apt-get )"
APTGETCMD="env DEBIAN_FRONTEND=noninteractive ${APTGET}"
APTGETOPTS="-o Apt::Install-Recommends=false \
    -o Apt::Get::Assume-Yes=true \
    -o Apt::Get::AllowUnauthenticated=true \
    -o DPkg::Options::=--force-confmiss \
    -o DPkg::Options::=--force-confnew \
    -o DPkg::Options::=--force-overwrite \
    -o DPkg::Options::=--force-unsafe-io"
NEEDED="bash fontconfig vim-nox git zenity imagemagick librsvg2-bin"

function echospaced() {
    printf "\n# ${1}\n"
}

echospaced "Configuring passwordless sudo ..."
echo "${USER} ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/subliminal-vim > /dev/null

for DEP in ${NEEDED}; do
    if ! dpkg -L ${DEP} >/dev/null 2>&1; then
        DEPENDS="${DEP} ${DEPENDS}"
    fi
done

if [ -n "${DEPENDS}" ]; then
    echospaced "Installing missing dependencies ..."
    sudo ${APTGETCMD} ${APTGETOPTS} update
    sudo ${APTGETCMD} ${APTGETOPTS} install ${DEPENDS}
fi

echospaced "Downloading vim-plug ..."
curl --create-dirs -fLo ${TEMPDIR}/autoload/plug.vim https://git.io/VgrSsw

if [ -d "${HOME}/.subliminal-vim" ]; then
    echospaced "Saving backup of current installation to ${HOME}/.subliminal-vim.bak ..."
    rm -rf ${HOME}/.subliminal-vim.bak
    mv ${HOME}/.subliminal-vim ${HOME}/.subliminal-vim.bak
fi

cat <<EOF > "${TEMPDIR}/install.vim"
set runtimepath+=${TEMPDIR}
call plug#begin()
Plug 'LuisAlejandro/subliminal-vim', {'dir': '~/.subliminal-vim/app', 'do': './install.sh', 'branch': 'development'}
call plug#end()
EOF

echospaced "Installing vim plugins ..."
vim -u ${TEMPDIR}/install.vim +PlugInstall +qall
bash ${HOME}/.subliminal-vim/app/subliminal-vim.sh
rm -rf "${TEMPDIR}"