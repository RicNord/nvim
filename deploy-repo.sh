#!/bin/bash

NVIM_DIR="${HOME}/.config/nvim"

if [ -L $NVIM_DIR ]; then
	unlink $NVIM_DIR
fi
if [ -d $NVIM_DIR ]; then
	rm -rf $NVIM_DIR
fi

mkdir -p "${NVIM_DIR}/lua/"

cp -f ./init.lua "${NVIM_DIR}/init.lua"
cp -rf ./lua/ "${NVIM_DIR}"

