#!/usr/bin/env bash
#   This file is part of Subliminal View
#   Copyright (c) 2016, Subliminal View Developers
#
#   Please refer to CONTRIBUTORS.md for a complete list of Copyright
#   holders.
#
#   Subliminal View is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   Subliminal View is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program. If not, see <http://www.gnu.org/licenses/>.


function echospaced() {
    printf "\n# %s\n" "${1}"
}

USER="$( id -un )"
APTGET="$( which apt-get )"
APTGETCMD="env DEBIAN_FRONTEND=noninteractive ${APTGET}"
APTGETOPTS="-o Apt::Install-Recommends=false \
    -o Apt::Get::Assume-Yes=true \
    -o Apt::Get::AllowUnauthenticated=true \
    -o DPkg::Options::=--force-confmiss \
    -o DPkg::Options::=--force-confnew \
    -o DPkg::Options::=--force-overwrite \
    -o DPkg::Options::=--force-unsafe-io"
NEEDED="git zenity curl bash gksu"

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

if [ -d "${HOME}/.config/subliminal-view" ]; then
    echospaced "Creating backup of current installation to ${HOME}/.config/subliminal-view.bak ..."
    rm -rf ${HOME}/.config/subliminal-view.bak
    mv ${HOME}/.config/subliminal-view ${HOME}/.config/subliminal-view.bak
fi

echospaced "Downloading vim-plug ..."
curl --create-dirs -fLo ${HOME}/.config/subliminal-view/plug/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echospaced "Cloning Subliminal View ..."
git clone --branch development --depth 1 --single-branch \
    https://github.com/LuisAlejandro/subliminal-view.git ${HOME}/.config/subliminal-view/app

echospaced "Installing Subliminal View ..."
bash ${HOME}/.config/subliminal-view/app/subliminal-view.sh