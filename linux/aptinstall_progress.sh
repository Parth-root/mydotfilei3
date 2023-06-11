#! /bin/bash
#recomended package to install on new linux machine
#upgrade is going to be taking lonf as par your pc update status
#first is banner function to  display massage
clear
cd ..
curdirgit=$PWD
cd linux
banner() {
    msg="  $*  "
    edge=$(echo "$msg" | sed 's/./-/g')
    #echo -e "\n"
    echo -e "\n+$edge+"
    echo    "|$msg|"
    echo -e "+$edge+\n"
    #echo -e "\n"
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
if [[ $1 != 100 ]]; then
        tput cup $((`tput lines`-1))
        echo -ne "\033[K"
        tput rc
        echo -ne "\033[1A"
else    
        tput rc 
fi      
}

#starting instaling

pbar 1
banner "Startship instaling..."
sleep 1
pbar 5
sudo apt install curl -y
pbar 12
curl -sS https://starship.rs/install.sh | sh
sudo apt update -y
sudo apt upgrade -y
pbar 22
sudo apt install neofetch expect -y
ipbar 31
banner "instaling i3 & kitty & git "
sleep 1
sudo apt install i3 kitty git -y
pbar 41

#kitty theam 
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
banner "instaling stow & polybar & rofi & neovim & Nitrogen & ranger"
sleep 1
sudo apt install stow polybar rofi neovim nitrogen ranger -y
pbar 52
banner "comman softare"
sleep 1
sudo apt-get install software-properties-common cmake -y
pbar 56
banner "python3 pip"
sudo apt install python3-pip -y
pbar 60
sudo pip3 install i3ipc
# extra all commented
banner "temp sensore"
sleep 1
#sudo apt install lm-sensors -y

#echo "Remeber gpick isinstalled for piking color"
#apt instll gpick

# ---------------------------picom jonaburg -----------------
banner picom
read -p "Do you want to install picom? [y/n] " yn

case $yn in 
        y ) 
                banner "ok , instaling picom"
		sudo apt install libxext-dev libxcb1-dev libxcb-dpms0-dev libgl-dev libegl-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson
		
		cd 
		ls git_all &> /dev/null
		if [[ $? != 0 ]]; then
        	mkdir git_all
		fi
		cd git_all
		git clone https://github.com/jonaburg/picom.git
		cd picom/
		git submodule update --init --recursive
		sudo meson --buildtype=release . build
		#sudo meson configure -Dprefix=/usr/local/picom build   #remove # if found not working
		sudo ninja -C build
		sudo ninja -C build install
                ;;
        * ) banner "skiping picom dont add blur adn effect";;
esac
pbar 71
# -------------------------- end picom ----------------------
# fzf # install from full

#(good file manager)

# ----------------------------------Script to add line in file ----------------
cd $curdirgit
cd linux
banner "ading line to make things work"
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
pbar 94
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
banner "--------------------> END <-------------------- "
