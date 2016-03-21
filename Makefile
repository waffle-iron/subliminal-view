#!/usr/bin/make -f
# -*- makefile -*-

APTGET=$(shell which apt-get )
APTGETCMD=env DEBIAN_FRONTEND=noninteractive ${APTGET}
APTGETOPTS=-qq -o Apt::Install-Recommends=false \
	-o Apt::Get::Assume-Yes=true \
	-o Apt::Get::AllowUnauthenticated=true \
	-o DPkg::Options::=--force-confmiss \
	-o DPkg::Options::=--force-confnew \
	-o DPkg::Options::=--force-overwrite \
	-o DPkg::Options::=--force-unsafe-io

all:

	@sudo ${APTGETCMD} ${APTGETOPTS} install python-dev python3-dev python-flake8 cmake golang build-essential npm vim-nox silversearcher-ag exuberant-ctags libboost-python-dev libboost-filesystem-dev libboost-thread-dev libboost-regex-dev libclang-dev
	@git submodule update --init --recursive
	@cd bundle/YouCompleteMe && python install.py --clang-completer --gocode-completer --tern-completer --system-libclang --system-boost

install:

	@mkdir -p ${HOME}/.vim/{bundle,rc}
	@mkdir -p ${HOME}/.local/share/fonts
	@cp -r bundle/* ${HOME}/.vim/bundle/
	@cp -r rc/* ${HOME}/.vim/rc/
	@cp vimrc ${HOME}/.vimrc
	@cd ${HOME}/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf
	@fc-cache -rfv
	@echo "stty -ixon" >> ${HOME}/.bashrc
	



uninstall:
	@rm -rf ${HOME}/{.vim,.vimrc}

