#!/usr/bin/make -f
# -*- makefile -*-

APTGET=$(shell which apt-get )
APTGETCMD=env DEBIAN_FRONTEND=noninteractive ${APTGET}
APTGETOPTS=-o Apt::Install-Recommends=false \
	-o Apt::Get::Assume-Yes=true \
	-o Apt::Get::AllowUnauthenticated=true \
	-o DPkg::Options::=--force-confmiss \
	-o DPkg::Options::=--force-confnew \
	-o DPkg::Options::=--force-overwrite \
	-o DPkg::Options::=--force-unsafe-io
TRMFONTNAME=Droid Sans Mono for Powerline 11
TRMPROFILEID=$(shell dconf list /org/gnome/terminal/legacy/profiles:/ | sed -n '1p' | sed 's|/||g')


all:

	@sudo ${APTGETCMD} update
	@sudo ${APTGETCMD} ${APTGETOPTS} install python-dev python3-dev cmake golang build-essential npm vim-nox silversearcher-ag exuberant-ctags libboost-python-dev libboost-filesystem-dev libboost-thread-dev libboost-regex-dev libclang-dev shellcheck devscripts ruby python3-pip clang-tidy php-cli
	@sudo npm install -g textlint-plugin-html textlint jshint jscs textlint-plugin-markdown csslint
	@sudo gem install rubocop
	@sudo pip install flake8 vim-vint
	@git submodule update --init --recursive
	@git submodule foreach --recursive git reset --hard
	@git submodule foreach --recursive git clean -fd
	@cd bundle/YouCompleteMe && python install.py --clang-completer --gocode-completer --tern-completer --system-libclang --system-boost

install:

	@if [ -f ${HOME}/.vimrc ]; then \
		rm -rf ${HOME}/.vimrc.bak; \
		mv ${HOME}/.vimrc ${HOME}/.vimrc.bak; \
	fi
	@if [ -d ${HOME}/.vim  ]; then \
		rm -rf ${HOME}/.vim.bak; \
		mv ${HOME}/.vim ${HOME}/.vim.bak; \
	fi
	@mkdir -p ${HOME}/.vim/bundle
	@mkdir -p ${HOME}/.vim/tempdir
	@mkdir -p ${HOME}/.vim/view
	@mkdir -p ${HOME}/.local/share/fonts
	@cp -rv bundle/* ${HOME}/.vim/bundle/
	@cp -rv fonts/* ${HOME}/.local/share/fonts/
	@cp -rv main.vim ${HOME}/.vimrc
	@cp -rv common.vim keymap.vim library.vim commands.vim plugins.vim ${HOME}/.vim/
	@fc-cache -rfv ${HOME}/.local/share/fonts
	@echo "stty -ixon" >> ${HOME}/.bashrc
	@dconf write /org/gnome/terminal/legacy/profiles:/${TRMPROFILEID}/font "'${TRMFONTNAME}'"
	@bash

#
# uninstall:
# 	@rm -rf ${HOME}/{.vim,.vimrc}
#
