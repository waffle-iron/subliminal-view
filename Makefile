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
