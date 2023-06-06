#! /bin/bash
#recomended package to install on new linux machine
#run with sudo permision
#upgrade is going to be taking lonf as par your pc update status

cd $HOME
sudo apt update -y
sudo apt upgrade -y
sudo apt install curl -y
echo -e '\n'
echo 'instaling starship'

sudo curl -sS https://starship.rs/install.sh | sh -y
echo -e '\n'
echo 'instaling starship to terminal'
echo -e '\n'
echo 'eval "$(starship init bash)"' >> .bashrc

sudo apt install i3 -y
sudo apt install kitty -y
sudo apt install git -y

#kitty theam 
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes

#select theme and change name Afterglow to you convinient

cd .config/kitty

ln -sf ./kitty-themes/themes/Afterglow.conf ~/.config/kitty/theme.conf

echo 'include ./theme.conf' >> kitty.conf

cd $HOME

echo 'stow to restore file'

sudo apt install stow -y

echo 'polybar for bar on upper side in i3'

sudo apt install polybar -y

echo 'Rofi to start application'

sudo apt install rofi -y

echo 'comman softare'

sudo apt-get install software-properties-common
sudo apt install neovim -y


sudo apt install python3-pip -y
sudo pip3 install i3ipc

#mkdir all_dot_file
#cd all_dot_file
# extra all commented
#echo 'Nitrogen for wallpaper piker'
#apt install nitrogen -y
#echo "temp sensore"
#apt install lm-sensors -y

#echo "Remeber gpick isinstalled for piking color"
#echo "If you feel you dont need it make it  comented "
#echo "or remove after this script"
#apt instll gpick


#  picom
# fzf # install from full
# nvim and vim # install from git nvim
#(good file manager)
