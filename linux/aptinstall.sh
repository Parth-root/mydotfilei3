#! /bin/bash
#recomended package to install on new linux machine
#upgrade is going to be taking lonf as par your pc update status
#first is banner function to  display massage
cd ..
curdirgit=$PWD
cd linux
banner() {
    msg="# $* #"
    edge=$(echo "$msg" | sed 's/./#/g')
    echo "$edge"
    echo "$msg"
    echo "$edge"
}

banner "Startship instaling..."
sudo apt install curl -y
curl -sS https://starship.rs/install.sh | sh
sudo apt update -y
sudo apt upgrade -y
sudo apt install expect -y
banner "instaling starship to terminal"
sleep 1

echo 'eval "$(starship init bash)"' >> .bashrc
sudo apt install i3 -y
sudo apt install kitty -y
sudo apt install git -y

#kitty theam 
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes

#select theme and change name Afterglow to you convinient
cd
cd .config/kitty
ln -sf ./kitty-themes/themes/Afterglow.conf ~/.config/kitty/theme.conf
echo 'include ./theme.conf' >> kitty.conf
cd 
banner "stow to restore file"
sleep 1
sudo apt install stow -y
banner "polybar for bar on upper side in i3"
sleep 1
sudo apt install polybar -y
banner "Rofi to start application"
sleep 1
sudo apt install rofi -y
banner "comman softare"
sleep 1
sudo apt-get install software-properties-common
sudo apt install neovim -y


sudo apt install python3-pip -y
sudo pip3 install i3ipc

#mkdir all_dot_file
#cd all_dot_file
# extra all commented
banner "Nitrogen for wallpaper piker"
sleep 1
sudo apt install nitrogen -y
banner "temp sensore"
sleep 1
#sudo apt install lm-sensors -y

#echo "Remeber gpick isinstalled for piking color"
#echo "If you feel you dont need it make it  comented "
#echo "or remove after this script"
#apt instll gpick


#  picom
# fzf # install from full
# nvim and vim # install from git nvim
#(good file manager)


# -------------------------------script for stow ---------------------------
cd $curdirgit
cd alldot
pwd 
ls
banner "runing Stow script"
sleep 2
#./masterstow.sh
