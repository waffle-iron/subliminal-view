#!/usr/bin/make -f
# -*- makefile -*-
#


all:

	@sudo aptitude install python-dev python3-dev python-flake8 cmake golang build-essential npm vim-nox silversearcher-ag exuberant-ctags
	@git submodule update --init --recursive
	@cd bundle/YouCompleteMe
	@python install.py --clang-completer --gocode-completer --tern-completer


environment:

	@virtualenv --python=python2.7 virtualenv
	@virtualenv/bin/pip install lxml
