#!/bin/bash

rm -rf ~/.config/nvim/
mkdir -p ~/.config/nvim/lua/

cp -f ./init.lua ~/.config/nvim/init.lua
cp -rf ./lua/ ~/.config/nvim/lua/

