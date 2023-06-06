#!/bin/bash
cd
echo "Statship in bash"
echo 'eval "$(starship init bash)"' >> .bashrc
cd
echo "Kitty theam add"
cd .config/kitty
ln -sf ./kitty-themes/themes/3024_Night.conf ~/.config/kitty/theme.conf
echo 'include ./theme.conf' >> kitty.conf
cd

