#!/bin/bash -x

yay -S neovim
yay -S neovim-plug

mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/

rm ~/.vimrc
ln -s $PWD/.vimrc ~/.vimrc

