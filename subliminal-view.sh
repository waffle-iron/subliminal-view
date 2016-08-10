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

TEMPFILE="$( mktemp -u )"
APTGET="$( which apt-get )"
APTGETCMD="env DEBIAN_FRONTEND=noninteractive ${APTGET}"
APTGETOPTS="-o Apt::Install-Recommends=false \
    -o Apt::Get::Assume-Yes=true \
    -o Apt::Get::AllowUnauthenticated=true \
    -o DPkg::Options::=--force-confmiss \
    -o DPkg::Options::=--force-confnew \
    -o DPkg::Options::=--force-overwrite \
    -o DPkg::Options::=--force-unsafe-io"

eval "$( tr '\0' '\n' < /proc/${$}/environ | grep '^DISPLAY=' )"

BUILDPKGLIST="make imagemagick librsvg2-bin"
RUNPKGLIST="silversearcher-ag exuberant-ctags xclip rxvt-unicode-256color \
            wmctrl vim-gtk python-kivy fontconfig git zenity curl bash gksu \
            xdg-utils coreutils"

RUBYSNDBX="${HOME}/.config/subliminal-view/sandboxes/ruby"
PYTHONSNDBX="${HOME}/.config/subliminal-view/sandboxes/python"
NODESNDBX="${HOME}/.config/subliminal-view/sandboxes/node"
GOSNDBX="${HOME}/.config/subliminal-view/sandboxes/go"

INSTALL_ARGS_FILE="${HOME}/.config/subliminal-view/install-args.conf"
WINDOW_ICON="${HOME}/.local/share/icons/hicolor/22x22/apps/subliminal-view.png"


if [ ! -f "${INSTALL_ARGS_FILE}" ]; then

    INSTALLDESC="Subliminal View ships with linting, syntax highlighting and \
completion support. Please select below which ones would you like to activate."

    ANS="$( zenity --list --text "${INSTALLDESC}" --checklist --separator "\n" \
        --height 500 --width 800 --hide-column 4 --print-column 4 --window-icon "${WINDOW_ICON}" \
        --column "Select" --column "Language" --column "Description" --column "O" \
        TRUE "Python" "Uses pep8, pylint, pyflakes and pydocstyle as linters, and neocomplete for completion." include-python \
        TRUE "Ruby" "Uses rubocop and ruby as linters and neocomplete for completion." include-ruby \
        TRUE "Shell/Bash" "Uses sh, checkbashisms and shellcheck as linters." include-shell \
        TRUE "Javascript and JSON" "Uses jshint as linter." include-js \
        TRUE "HTML, XHTML and XML" "Uses tidy and xmllint as linters." include-html \
        TRUE "YAML" "Uses yamllint as linter." include-yaml \
        TRUE "PO" "Uses gettext as linter." include-po \
        TRUE "CSS, SASS, SCSS and LESS" "Uses csslint, less and sass-lint as linters." include-css \
        TRUE "Markdown and RST" "Uses textlint and docutils as linters." include-markdown \
        TRUE "Dockerfile" "Uses dockerfile_lint as linter." include-docker \
        TRUE "Go" "Uses go, gofmt and golint as linters." include-go \
        TRUE "Vim" "Uses vint as a linter." include-vim \
        FALSE "C, C++, Obj-C and Obj-C++" "Uses GCC to find syntax errors." include-c \
        FALSE "C#" "Uses mono to find syntax errors." include-csharp \
        FALSE "SQL" "Uses sqlint as linter." include-sql \
        FALSE "PHP" "Uses php (cli) to find syntax errors." include-php \
        FALSE "Rust" "Uses rustc as linter." include-rust 2>/dev/null )"

    if [ ${?} -eq 1 ]; then
        exit 0
    fi

    if [ -n "${ANS}" ]; then
        printf -- '--%s\n' ${ANS} > ${INSTALL_ARGS_FILE}
    else
        touch ${INSTALL_ARGS_FILE}
    fi
fi

INSTALL_ARGS="$( cat ${INSTALL_ARGS_FILE} )"

for OPT in ${INSTALL_ARGS}; do
    case ${OPT} in
        --include-python)
            PYTHONPKGLIST="pylint pyflakes pep8 pydocstyle ${PYTHONPKGLIST}"
            BUILDPKGLIST="virtualenv python-dev ${BUILDPKGLIST}"
            RUNPKGLIST="python ${RUNPKGLIST}"
        ;;

        --include-shell)
            RUNPKGLIST="bash devscripts shellcheck ${RUNPKGLIST}"
        ;;

        --include-js)
            NODEPKGLIST="jshint jsonlint ${NODEPKGLIST}"
            RUNPKGLIST="nodejs ${RUNPKGLIST}"
        ;;

        --include-ruby)
            RUBYPKGLIST="rubocop ${RUBYPKGLIST}"
            BUILDPKGLIST="ruby-dev ${BUILDPKGLIST}"
            RUNPKGLIST="ruby ${RUNPKGLIST}"
        ;;

        --include-go)
            GOPKGLIST="github.com/golang/lint/golint ${GOPKGLIST}"
            RUNPKGLIST="golang-go ${RUNPKGLIST}"
        ;;

        --include-markdown)
            RUBYPKGLIST="mdl ${RUBYPKGLIST}"
            PYTHONPKGLIST="docutils ${PYTHONPKGLIST}"
            BUILDPKGLIST="virtualenv python-dev ruby-dev ${BUILDPKGLIST}"
            RUNPKGLIST="python ruby ${RUNPKGLIST}"
        ;;

        --include-po)
            RUNPKGLIST="gettext ${RUNPKGLIST}"
        ;;

        --include-html)
            RUNPKGLIST="tidy libxml2-utils ${RUNPKGLIST}"
        ;;

        --include-yaml)
            PYTHONPKGLIST="yamllint ${PYTHONPKGLIST}"
            BUILDPKGLIST="virtualenv python-dev ${BUILDPKGLIST}"
            RUNPKGLIST="python ${RUNPKGLIST}"
        ;;

        --include-css)
            NODEPKGLIST="csslint sass-lint less ${NODEPKGLIST}"
            RUNPKGLIST="nodejs ${RUNPKGLIST}"
        ;;

        --include-c)
            RUNPKGLIST="gcc ${RUNPKGLIST}"
        ;;

        --include-csharp)
            RUNPKGLIST="mono-devel ${RUNPKGLIST}"
        ;;

        --include-vim)
            PYTHONPKGLIST="vim-vint ${PYTHONPKGLIST}"
            BUILDPKGLIST="virtualenv python-dev ${BUILDPKGLIST}"
            RUNPKGLIST="python ${RUNPKGLIST}"
        ;;

        --include-sql)
            RUBYPKGLIST="sqlint ${RUBYPKGLIST}"
            BUILDPKGLIST="ruby-dev ${BUILDPKGLIST}"
            RUNPKGLIST="ruby ${RUNPKGLIST}"
        ;;

        --include-php)
            RUNPKGLIST="php5-cli ${RUNPKGLIST}"
        ;;

        --include-docker)
            NODEPKGLIST="dockerfile_lint ${NODEPKGLIST}"
            RUNPKGLIST="nodejs ${RUNPKGLIST}"
        ;;

        --include-rust)
            RUNPKGLIST="rustc ${RUNPKGLIST}"
        ;;
    esac
done

for DDEP in ${BUILDPKGLIST} ${RUNPKGLIST}; do
    if ! dpkg -L ${DDEP} >/dev/null 2>&1; then
        DDEPENDS="${DDEP} ${DDEPENDS}"
    fi
done

for RDEP in ${RUBYPKGLIST}; do
    if [ ! -f "${HOME}/.config/subliminal-view/sandboxes/ruby/bin/${RDEP}" ]; then
        RDEPENDS="${RDEP} ${RDEPENDS}"
    fi
done

for PDEP in ${PYTHONPKGLIST}; do
    REALBIN="${PDEP}"
    if [ "${PDEP}" == "docutils" ]; then
        REALBIN="rst2pseudoxml.py"
    fi
    if [ "${PDEP}" == "vim-vint" ]; then
        REALBIN="vint"
    fi
    if [ ! -f "${HOME}/.config/subliminal-view/sandboxes/python/bin/${REALBIN}" ]; then
        PDEPENDS="${PDEP} ${PDEPENDS}"
    fi
done

for NDEP in ${NODEPKGLIST}; do
    REALBIN="${NDEP}"
    if [ "${NDEP}" == "less" ]; then
        REALBIN="lessc"
    fi
    if [ ! -f "${HOME}/.config/subliminal-view/sandboxes/node/node_modules/.bin/${REALBIN}" ]; then
        NDEPENDS="${NDEP} ${NDEPENDS}"
    fi
done

for GDEP in ${GOPKGLIST}; do
    REALBIN="${GDEP}"
    if [ "${GDEP}" == "github.com/golang/lint/golint" ]; then
        REALBIN="golint"
    fi
    if [ ! -f "${HOME}/.config/subliminal-view/sandboxes/go/bin/${REALBIN}" ]; then
        GDEPENDS="${GDEP} ${GDEPENDS}"
    fi
done

mkfifo ${TEMPFILE}
zenity --progress --pulsate --auto-close --no-cancel --window-icon "${WINDOW_ICON}" \
    --height 100 --width 600 < ${TEMPFILE} 2>/dev/null &

{
    if [ -n "${DDEPENDS}" ]; then
        echospaced "Installing missing dpkg dependencies ..."

        if [ -n "${NODEPKGLIST}" ]; then
            sudo -E bash <(curl -sfLo- https://deb.nodesource.com/setup_6.x) >/dev/null 2>&1
        fi

        gksudo -- ${APTGETCMD} ${APTGETOPTS} update
        gksudo -- ${APTGETCMD} ${APTGETOPTS} install ${DDEPENDS}
    fi

    if [ -n "${RDEPENDS}" ]; then
        echospaced "Installing missing ruby dependencies ..."
        mkdir -vp ${RUBYSNDBX}
        gem install --install-dir ${RUBYSNDBX} ${RUBYPKGLIST}
    fi

    if [ -n "${PDEPENDS}" ]; then
        echospaced "Installing missing python dependencies ..."
        mkdir -vp ${PYTHONSNDBX}
        virtualenv ${PYTHONSNDBX}
        ${PYTHONSNDBX}/bin/pip install ${PYTHONPKGLIST}
    fi

    if [ -n "${NDEPENDS}" ]; then
        echospaced "Installing missing nodejs dependencies ..."
        mkdir -vp ${NODESNDBX}
        npm --prefix ${NODESNDBX} install ${NODEPKGLIST}
    fi

    if [ -n "${GDEPENDS}" ]; then
        echospaced "Installing missing go dependencies ..."
        mkdir -vp ${GOSNDBX}
        export GOPATH="${GOSNDBX}"
        go get -v ${GOPKGLIST}
    fi

} | tee ${TEMPFILE}


#xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom -r -R
#xfconf-query -c xfce4-keyboard-shortcuts -p /xfwm4/custom -r -R

if [ ! -d "${HOME}/.config/subliminal-view/recovery" ]; then
    bash "${HOME}/.config/subliminal-view/app/configure.sh"
fi

env XENVIRONMENT="${HOME}/.config/subliminal-view/app/Xresources" \
    urxvt -perl-lib "${HOME}/.config/subliminal-view/app/extensions" \
        -icon "${WINDOW_ICON}" -name "subliminal-view" -e bash -c \
            "stty -ixon susp undef; \
                vim --servername subliminal-view-${$} \
                    -u ${HOME}/.config/subliminal-view/app/init.vim ${*}"
