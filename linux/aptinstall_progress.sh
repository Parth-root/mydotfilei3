#! /bin/bash
#recomended package to install on new linux machine
#upgrade is going to be taking lonf as par your pc update status
#first is banner function to  display massage
clear
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
# progress bar function
# Parth-root edited
function pbar {
	echo ""
	let _progress=(${1}*100/100*100)/100  # Process data
	let _done=(${_progress}*4)/10
	let _left=40-$_done
# Build progressbar string lengths
	_done=$(printf "%${_done}s")
	_left=$(printf "%${_left}s")
tput sc #save the current cursor position
tput cup $((`tput lines`-1))
printf "\rProgress : [${_done// /#}${_left// /-}] ${_progress}%%"
sleep 1.5
tput cup $((`tput lines`-1))
echo -ne "\033[K"
tput rc
echo -ne "\033[1A"
}

#starting instaling

pbar 1
banner "Startship instaling..."
pbar 5
sudo apt install curl -y
pbar 12
curl -sS https://starship.rs/install.sh | sh
sudo apt update -y
sudo apt upgrade -y
pbar 22
sudo apt install neofetch -y
pbar 28
sudo apt install expect -y
pbar 31
banner "instaling starship to terminal"
sleep 1
sudo apt install i3 -y
pbar 38
sudo apt install kitty -y
pbar 40
sudo apt install git -y
pbar 45

#kitty theam 
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
banner "stow to restore file"
sleep 1
sudo apt install stow -y
pbar 50
banner "polybar for bar on upper side in i3"
sleep 1
sudo apt install polybar -y
banner "Rofi to start application"
sleep 1
sudo apt install rofi -y
pbar 52
banner "comman softare"
sleep 1
sudo apt-get install software-properties-common
pbar 56
banner "neovim"
sudo apt install neovim -y
pbar 58
banner "python3 pip"
sudo apt install python3-pip -y
pbar 60
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
banner "ading line to make things work"
pbar 61
pbar 61
read -p "Do you want to install script line? [y/n] " yn

case $yn in 
	y ) 
		banner "ok, we will proceed"
		echo $PWD
		ls
		./allline.sh;;
	* ) banner "skiped";;
esac
pbar 67
# -------------------------------script for stow ---------------------------
cd $curdirgit
cd alldot
banner "runing Stow script"
sleep 2
pbar 71
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
pbar 100
banner "end off line"
