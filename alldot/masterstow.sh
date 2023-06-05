#!/bin/bash
echo -e "\nUpdating all file\nconecting all file\n.....\n...........\n....................."
cd i3
stow --verbose=3 ./ -t ~/
cd ..
cd kitty
stow --verbose=3 ./ -t ~/
cd ..
cd polybar
stow --verbose=3 ./ -t ~/
cd ..
cd rofi
stow --verbose=3 ./ -t ~/
cd ..
echo $?
#test
#test1
lol


