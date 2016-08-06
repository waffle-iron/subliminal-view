#!/usr/bin/env bash


export DISPLAY="$( cat /proc/$$/environ | tr '\0' '\n' | \
                   grep '^DISPLAY=' | awk -F= '{print $2}')"

APTGET="$( which apt-get )"
APTGETCMD="env DEBIAN_FRONTEND=noninteractive ${APTGET}"
APTGETOPTS="-o Apt::Install-Recommends=false \
    -o Apt::Get::Assume-Yes=true \
    -o Apt::Get::AllowUnauthenticated=true \
    -o DPkg::Options::=--force-confmiss \
    -o DPkg::Options::=--force-confnew \
    -o DPkg::Options::=--force-overwrite \
    -o DPkg::Options::=--force-unsafe-io"

BUILDPKGLIST="make imagemagick librsvg2-bin"
RUNPKGLIST="silversearcher-ag exuberant-ctags xclip rxvt-unicode-256color \
            wmctrl zenity vim-nox bash fontconfig git"

RUBYSNDBX="${HOME}/.subliminal-vim/sandboxes/ruby"
PYTHONSNDBX="${HOME}/.subliminal-vim/sandboxes/python"
NODESNDBX="${HOME}/.subliminal-vim/sandboxes/node"
GOSNDBX="${HOME}/.subliminal-vim/sandboxes/go"

INSTALL_ARGS_FILE="${HOME}/.subliminal-vim/install-args.conf"


if [ ! -f "${INSTALL_ARGS_FILE}" ]; then
    INSTALLDESC="Subliminal Vim ships with linting, syntax highlighting and \
completion support. Please select below which ones would you like to activate."
    ANS="$( zenity --list --text "${INSTALLDESC}" --checklist --separator "\n" \
        --height 500 --width 800 --hide-column 4 --print-column 4 \
        --column "Select" --column "Language" --column "Description" --column "O" \
        TRUE "Python" "Python" include-python \
        TRUE "Ruby" "Ruby" include-ruby \
        TRUE "Shell/Bash" "Shell/Bash" include-shell \
        TRUE "Javascript" "Javascript" include-js \
        TRUE "HTML" "HTML" include-html \
        TRUE "CSS" "CSS" include-css \
        TRUE "JSON" "JSON" include-json \
        TRUE "Markdown" "Markdown" include-markdown \
        TRUE "Docker" "Docker" include-docker \
        TRUE "Go" "Go" include-go \
        TRUE "Vim" "Vim" include-vim \
        FALSE "C" "C" include-c \
        FALSE "C++" "C++" include-cpp \
        FALSE "C#" "C#" include-csharp \
        FALSE "SQL" "SQL" include-sql \
        FALSE "PHP" "PHP" include-php \
        FALSE "Rust" "Rust" include-rust )"

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

function echospaced() {
    printf "\n# ${1}\n"
}

for OPT in ${INSTALL_ARGS}; do
    case ${OPT} in
        -p|--include-python)
            PYTHONPKGLIST="pylint pyflakes pep8 pydocstyle ${PYTHONPKGLIST}"
            BUILDPKGLIST="virtualenv python-dev ${BUILDPKGLIST}"
            RUNPKGLIST="python ${RUNPKGLIST}"
        ;;

        -sh|--include-shell)
            RUNPKGLIST="bash devscripts shellcheck ${RUNPKGLIST}"
        ;;

        -j|--include-js)
            NODEPKGLIST="jshint jscs ${NODEPKGLIST}"
            RUNPKGLIST="nodejs ${RUNPKGLIST}"
        ;;

        -r|--include-ruby)
            RUBYPKGLIST="rubocop ${RUBYPKGLIST}"
            BUILDPKGLIST="ruby-dev ${BUILDPKGLIST}"
            RUNPKGLIST="ruby ${RUNPKGLIST}"
        ;;

        -g|--include-go)
            GOPKGLIST="github.com/alecthomas/gometalinter ${GOPKGLIST}"
            RUNPKGLIST="golang-go ${RUNPKGLIST}"
            export GOPATH=/usr/lib/go
        ;;

        -m|--include-markdown)
            NODEPKGLIST="textlint textlint-plugin-markdown ${NODEPKGLIST}"
            RUNPKGLIST="nodejs ${RUNPKGLIST}"
        ;;

        -h|--include-html)
            NODEPKGLIST="textlint textlint-plugin-html ${NODEPKGLIST}"
            RUNPKGLIST="nodejs ${RUNPKGLIST}"
        ;;

        -css|--include-css)
            NODEPKGLIST="csslint ${NODEPKGLIST}"
            RUNPKGLIST="nodejs ${RUNPKGLIST}"
        ;;

        -c|--include-c)
            RUNPKGLIST="gcc ${RUNPKGLIST}"
        ;;

        -cpp|--include-cpp)
            RUNPKGLIST="gcc ${RUNPKGLIST}"
        ;;

        -cs|--include-csharp)
            RUNPKGLIST="mono-devel ${RUNPKGLIST}"
        ;;

        -v|--include-vim)
            PYTHONPKGLIST="vim-vint ${PYTHONPKGLIST}"
            BUILDPKGLIST="virtualenv python-dev ${BUILDPKGLIST}"
            RUNPKGLIST="python ${RUNPKGLIST}"
        ;;

        -s|--include-sql)
            RUBYPKGLIST="sqlint ${RUBYPKGLIST}"
            BUILDPKGLIST="ruby-dev ${BUILDPKGLIST}"
            RUNPKGLIST="ruby ${RUNPKGLIST}"
        ;;

        -php|--include-php)
            RUNPKGLIST="php5-cli ${RUNPKGLIST}"
        ;;

        -dc|--include-docker)
            NODEPKGLIST="dockerfile_lint ${NODEPKGLIST}"
            RUNPKGLIST="nodejs ${RUNPKGLIST}"
        ;;

        -jn|--include-json)
            NODEPKGLIST="jsonlint ${NODEPKGLIST}"
            RUNPKGLIST="nodejs ${RUNPKGLIST}"
        ;;

        -rs|--include-rust)
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
    if [ ! -f "${HOME}/.subliminal-vim/sandboxes/ruby/bin/${RDEP}" ]; then
        RDEPENDS="${RDEP} ${RDEPENDS}"
    fi
done

for PDEP in ${PYTHONPKGLIST}; do
    REALBIN="${PDEP}"
    if [ "${PDEP}" == "vim-vint" ]; then
        REALBIN="vint"
    fi
    if [ ! -f "${HOME}/.subliminal-vim/sandboxes/python/bin/${REALBIN}" ]; then
        PDEPENDS="${PDEP} ${PDEPENDS}"
    fi
done

for NDEP in ${NODEPKGLIST}; do
    REALBIN="${NDEP}"
    if [ "${NDEP}" == "textlint-plugin-markdown" ] || [ "${NDEP}" == "textlint-plugin-html" ]; then
        REALBIN="textlint"
    fi
    if [ ! -f "${HOME}/.subliminal-vim/sandboxes/node/node_modules/.bin/${REALBIN}" ]; then
        NDEPENDS="${NDEP} ${NDEPENDS}"
    fi
done

for GDEP in ${GUBYPKGLIST}; do
    if [ ! -f "${HOME}/.subliminal-vim/sandboxes/go/bin/${GDEP}" ]; then
        GDEPENDS="${GDEP} ${GDEPENDS}"
    fi
done

{
    if [ -n "${DDEPENDS}" ]; then
        echospaced "Installing missing dpkg dependencies ..."

        if [ -n "${NODEPKGLIST}" ]; then
            sudo -E bash <(curl -fLo- https://deb.nodesource.com/setup_6.x) >/dev/null 2>&1
        fi

        sudo ${APTGETCMD} ${APTGETOPTS} update
        sudo ${APTGETCMD} ${APTGETOPTS} install ${DDEPENDS}
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
        go get ${GOPKGLIST}
        ${GOSNDBX}/bin/gometalinter --install
    fi

} | tee /dev/fd/2 | zenity --progress --pulsate --auto-close \
    --no-cancel --height 100 --width 600 2>/dev/null

export XENVIRONMENT="${HOME}/.subliminal-vim/app/Xresources"

urxvt -perl-lib "${HOME}/.subliminal-vim/app/perl" \
    -icon "${HOME}/.local/share/icons/subliminal-vim.png" \
    -name "subliminal-vim" -e bash -c \
        "stty -ixon susp undef; \
            vim -u ${HOME}/.subliminal-vim/app/init.vim ${@}" &