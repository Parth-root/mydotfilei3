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
sudo apt install neofetch -y
sudo apt install expect -y
banner "instaling starship to terminal"
sleep 1
sudo apt install i3 -y
sudo apt install kitty -y
sudo apt install git -y

#kitty theam 
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
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
# extra all commented
banner "Nitrogen for wallpaper piker"
sleep 1
sudo apt install nitrogen -y
banner "temp sensore"
sleep 1
#sudo apt install lm-sensors -y

#echo "Remeber gpick isinstalled for piking color"
#apt instll gpick


#  picom
# fzf # install from full
# nvim and vim # install from git nvim
#(good file manager)

# ----------------------------------Script to add line in file ----------------
cd $curdirgit
cd linux
#!/bin/bash
banner "ading line to make things work"
read -p "Do you want to install script line? [y/n] " yn

case $yn in 
	y ) 
		banner "ok, we will proceed"
		echo $PWD
		ls
		./allline.sh;;
	* ) banner "skiped";;
esac
# -------------------------------script for stow ---------------------------
cd $curdirgit
cd alldot
banner "runing Stow script"
sleep 2
banner "Stow will set file to its location"                        
read -p "Continue? [y/n] " yn 

case $yn in 
        y ) 
                banner "ok, we will proceed"  
                echo $PWD
		ls
		./masterstow.sh;;
        * ) banner "skiped";;  
esac
banner "end off line"
