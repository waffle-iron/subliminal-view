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
BUILDPKGLIST=cmake golang npm \
		libboost-python-dev libboost-filesystem-dev libboost-thread-dev \
		libboost-regex-dev libclang-dev
RUNPKGLIST=clang-tidy bundler virtualenv npm php-cli silversearcher-ag exuberant-ctags vim-nox shellcheck devscripts


purge-run-deps:

	@sudo ${APTGETCMD} ${APTGETOPTS} remove ${RUNPKGLIST}

purge-build-deps:

	@sudo ${APTGETCMD} ${APTGETOPTS} remove ${BUILDPKGLIST}

run-deps:

	@sudo ${APTGETCMD} update
	@sudo ${APTGETCMD} ${APTGETOPTS} install ${RUNPKGLIST}
	@bundle install --gemfile data/Gemfile --path ${HOME}/.vim/sandboxes --standalone
	@npm --prefix ${HOME}/.vim/sandboxes install textlint-plugin-html textlint jshint jscs textlint-plugin-markdown csslint
	@virtualenv ${HOME}/.vim/sandboxes/virtualenv
	@${HOME}/.vim/sandboxes/virtualenv/bin/pip install flake8 vim-vint
	@export GOPATH=${HOME}/.vim/sandboxes/golang && go get github.com/alecthomas/gometalinter


build-deps:

	@sudo ${APTGETCMD} update
	@sudo ${APTGETCMD} ${APTGETOPTS} install ${BUILDPKGLIST}

build:

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
	@dconf write /org/gnome/terminal/legacy/profiles:/${TRMPROFILEID}/use-system-font "false"
	@bash

#
# uninstall:
# 	@rm -rf ${HOME}/{.vim,.vimrc}
#
