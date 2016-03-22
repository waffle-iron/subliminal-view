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
	@sudo ${APTGETCMD} ${APTGETOPTS} install python-dev python3-dev flake8 python-flake8 python3-flake8 cmake golang build-essential npm vim-nox silversearcher-ag exuberant-ctags libboost-python-dev libboost-filesystem-dev libboost-thread-dev libboost-regex-dev libclang-dev
	@git submodule update --init --recursive
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
	@mkdir -p ${HOME}/.vim/rc
	@mkdir -p ${HOME}/.vim/tempdir
	@mkdir -p ${HOME}/.vim/view
	@mkdir -p ${HOME}/.local/share/fonts
	@cp -rv bundle/* ${HOME}/.vim/bundle/
	@cp -rv rc/* ${HOME}/.vim/rc/
	@cp -rv fonts/* ${HOME}/.local/share/fonts/
	@cp -rv vimrc ${HOME}/.vimrc
	@fc-cache -rfv
	@echo "stty -ixon" >> ${HOME}/.bashrc
	@dconf write /org/gnome/terminal/legacy/profiles:/${TRMPROFILEID}/font "'${TRMFONTNAME}'"
	@bash

#
# uninstall:
# 	@rm -rf ${HOME}/{.vim,.vimrc}
#
