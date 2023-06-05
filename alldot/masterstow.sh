#!/bin/bash
echo -e "\nUpdating all file\nconecting all file\n.....\n...........\n........."
cd i3
stow -D --verbose=3 ./ -t ~/
cd ..

./deletbeforestow.sh i3

cd i3
stow --verbose=3 ./ -t ~/
cd ..

cd kitty
stow -D --verbose=3 ./ -t ~/
cd ..

./deletbeforestow.sh kitty

cd kitty
stow --verbose=3 ./ -t ~/
cd ..

cd polybar
stow -D --verbose=3 ./ -t ~/
cd ..

./deletbeforestow.sh polybar

cd polybar
stow --verbose=3 ./ -t ~/
cd ..

cd rofi
stow -D --verbose=3 ./ -t ~/
cd ..

./deletbeforestow.sh rofi

cd rofi
stow --verbose=3 ./ -t ~/
cd ..

echo $?
