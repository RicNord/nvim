#!/usr/bin/env bash


NVIM_DIR="${HOME}/.config/nvim"

if [ -L $NVIM_DIR ]; then
	unlink $NVIM_DIR
fi
if [ -d $NVIM_DIR ]; then
	rm -rf $NVIM_DIR
fi

ln -s $(pwd) $NVIM_DIR


