#!/usr/bin/env bash

APTGET="$( which apt-get )"
APTGETCMD="env DEBIAN_FRONTEND=noninteractive ${APTGET}"
APTGETOPTS="-o Apt::Install-Recommends=false \
    -o Apt::Get::Assume-Yes=true \
    -o Apt::Get::AllowUnauthenticated=true \
    -o DPkg::Options::=--force-confmiss \
    -o DPkg::Options::=--force-confnew \
    -o DPkg::Options::=--force-overwrite \
    -o DPkg::Options::=--force-unsafe-io"

BUILDPKGLIST="cmake build-essential imagemagick librsvg2-bin"
RUNPKGLIST="silversearcher-ag exuberant-ctags vim-nox xsel rsync \
    rxvt-unicode-256color wmctrl zenity"

RUBYSNDBX="${HOME}/.subliminal-vim/sandboxes/ruby"
PYTHONSNDBX="${HOME}/.subliminal-vim/sandboxes/python"
NODESNDBX="${HOME}/.subliminal-vim/sandboxes/node"
GOSNDBX="${HOME}/.subliminal-vim/sandboxes/go"
HASKELLSNDBX="${HOME}/.subliminal-vim/sandboxes/haskell"


while [ ${#} -gt 0 ]; do
    OPT="${1}"

    case ${OPT} in
        -p|--include-python)
            PYTHONPKGLIST="pylint pyflakes pep8 pydocstyle ${PYTHONPKGLIST}"
            BUILDPKGLIST="virtualenv python-dev ${BUILDPKGLIST}"
            RUNPKGLIST="python ${RUNPKGLIST}"
        ;;

        -sh|--include-shell)
            HASKELLPKGLIST="shellcheck ${HASKELLPKGLIST}"
            BUILDPKGLIST="cabal-install ${BUILDPKGLIST}"
            RUNPKGLIST="bash devscripts ${RUNPKGLIST}"
        ;;

        -j|--include-js)
            NODEPKGLIST="jshint jscs ${NODEPKGLIST}"
            RUNPKGLIST="nodejs ${RUNPKGLIST}"
            YCMOPTS="--tern-completer ${YCMOPTS}"
        ;;

        -r|--include-ruby)
            RUBYPKGLIST="rubocop ${RUBYPKGLIST}"
            BUILDPKGLIST="ruby-dev ${BUILDPKGLIST}"
            RUNPKGLIST="ruby ${RUNPKGLIST}"
        ;;

        -g|--include-go)
            GOPKGLIST="github.com/alecthomas/gometalinter ${GOPKGLIST}"
            RUNPKGLIST="golang ${RUNPKGLIST}"
            YCMOPTS="--gocode-completer ${YCMOPTS}"
            export GOPATH=/usr/lib/go
        ;;

        -m|--include-markdown)
            NODEPKGLIST="textlint textlint-plugin-markdown ${NODEPKGLIST}"
            RUNPKGLIST="nodejs ${RUNPKGLIST}"
        ;;

        -h|--include-html)
            NODEPKGLIST="textlint textlint-plugin-markdown ${NODEPKGLIST}"
            RUNPKGLIST="nodejs ${RUNPKGLIST}"
        ;;

        -css|--include-css)
            NODEPKGLIST="csslint ${NODEPKGLIST}"
            RUNPKGLIST="nodejs ${RUNPKGLIST}"
        ;;

        -c|--include-c)
            RUNPKGLIST="gcc ${RUNPKGLIST}"
            YCMOPTS="--clang-completer ${YCMOPTS}"
        ;;

        -cpp|--include-cpp)
            RUNPKGLIST="gcc ${RUNPKGLIST}"
            YCMOPTS="--clang-completer ${YCMOPTS}"
        ;;

        -cs|--include-csharp)
            RUNPKGLIST="mono-devel ${RUNPKGLIST}"
            YCMOPTS="--omnisharp-completer ${YCMOPTS}"
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
            YCMOPTS="--racer-completer ${YCMOPTS}"
        ;;

        -a|--include-all)
            RUNPKGLIST="rustc nodejs php5-cli ruby python gcc mono-devel bash \
                        devscripts golang ${RUNPKGLIST}"
            BUILDPKGLIST="ruby-dev virtualenv python-dev cabal-install \
                          ${BUILDPKGLIST}"
            NODEPKGLIST="textlint-plugin-html textlint jshint jscs \
                         textlint-plugin-markdown csslint dockerfile_lint \
                         jsonlint"
            PYTHONPKGLIST="vim-vint pylint pyflakes pep8 pydocstyle"
            GOPKGLIST="github.com/alecthomas/gometalinter"
            RUBYPKGLIST="sqlint rubocop"
            HASKELLPKGLIST="shellcheck"
            YCMOPTS="--racer-completer --tern-completer --clang-completer \
                     --omnisharp-completer --gocode-completer"
        ;;
    esac
    shift
done


rm -rf ${HOME}/.subliminal-vim
mkdir -p ${HOME}/.subliminal-vim/urxvt-ext
mkdir -p ${HOME}/.subliminal-vim/bundle
mkdir -p ${HOME}/.subliminal-vim/settings
mkdir -p ${HOME}/.subliminal-vim/recovery
mkdir -p ${HOME}/.subliminal-vim/backups
mkdir -p ${HOME}/.subliminal-vim/undo
mkdir -p ${HOME}/.local/share/fonts

if [ -n "${NODEPKGLIST}" ]; then
    wget -qO- https://deb.nodesource.com/setup_6.x | sudo -E bash -
fi

sudo ${APTGETCMD} ${APTGETOPTS} install ${BUILDPKGLIST} ${RUNPKGLIST}

git submodule update --init --recursive
git submodule foreach --recursive git clean -xfd

make --directory="bundle/vimproc"
python bundle/YouCompleteMe/install.py ${YCMOPTS}

convert -background None subliminal-vim.svg subliminal-vim.png


if [ -n "${RUBYPKGLIST}" ]; then
    mkdir -p ${RUBYSNDBX}
    gem install --install-dir ${RUBYSNDBX} ${RUBYPKGLIST}
fi

if [ -n "${PYTHONPKGLIST}" ]; then
    mkdir -p ${PYTHONSNDBX}
    virtualenv ${PYTHONSNDBX}
    ${PYTHONSNDBX}/bin/pip install ${PYTHONPKGLIST}
fi

if [ -n "${NODEPKGLIST}" ]; then
    mkdir -p ${NODESNDBX}
    npm --prefix ${NODESNDBX} install ${NODEPKGLIST}
fi

if [ -n "${GOPKGLIST}" ]; then
    mkdir -p ${GOSNDBX}
    export GOPATH="${GOSNDBX}"
    go get ${GOPKGLIST}
    ${GOSNDBX}/bin/gometalinter --install
fi

if [ -n "${HASKELLPKGLIST}" ]; then
    mkdir -p ${HASKELLSNDBX}
    cabal update
    cabal install --prefix ${HASKELLSNDBX} ${HASKELLPKGLIST}
fi


rsync -qavz fonts/* ${HOME}/.local/share/fonts/
rsync -qavz urxvt-ext/* ${HOME}/.subliminal-vim/urxvt-ext/
rsync -qavz settings/* ${HOME}/.subliminal-vim/settings/
rsync -qavz bundle/* ${HOME}/.subliminal-vim/bundle/
rsync -qavz Xresources subliminal-vim.png subliminal-vim.desktop subliminal-vim.sh ${HOME}/.subliminal-vim/
sudo ln -fs ${HOME}/.subliminal-vim/subliminal-vim.desktop /usr/share/applications/
sudo ln -fs ${HOME}/.subliminal-vim/subliminal-vim.sh /usr/bin/subliminal-vim
sudo ln -fs ${HOME}/.subliminal-vim/subliminal-vim.png /usr/share/icons/
sudo ln -fs ${HOME}/.subliminal-vim/urxvt-ext/* /usr/lib/urxvt/perl/
fc-cache -rfv ${HOME}/.local/share/fonts

sudo ${APTGETCMD} ${APTGETOPTS} purge ${BUILDPKGLIST}
