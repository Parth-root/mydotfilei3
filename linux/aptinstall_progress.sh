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
startpoint=0
function pbar {
if [[ $2 == 1 ]]
then
for (( i=$startpoint ; i<$1 ; i++ ));
do
        pbar i 2
done
fi
        let _progress=(${1}*100/100*100)/100  # Process data
        let _done=(${_progress}*10)/10
        let _left=100-$_done
# Build progressbar string lengths
        _done=$(printf "%${_done}s")
        _left=$(printf "%${_left}s")
tput sc #save the current cursor position
tput cup $((`tput lines`-1))
printf "\rProgress : [${_done// /:}${_left// /-}] ${_progress}%%"
if [[ $2 == 2 ]]
then
        sleep 0.1
else
sleep 1
fi
if [[ $1 != 100 &&  $2 != 2 ]]; then
        tput cup $((`tput lines`-1))
        echo -ne "\033[K"
        tput rc
        echo -ne "\033[1A"
else    
        tput rc 
fi      
startpoint=$1
}
#starting instaling

pbar 1 1
banner "Startship instaling..."
sleep 1 1
sudo apt install curl -y &>/dev/null
pbar 12 1
curl -sS https://starship.rs/install.sh | sh
sudo apt update -y
sudo apt upgrade -y
pbar 22 1
sudo apt install neofetch expect -y
pbar 31 1
banner "instaling i3 & kitty & git & screenshot"
sleep 1
sudo apt install i3 kitty git maim xclip xdotool -y

pbar 41 1
#kitty theam 
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
banner "instaling stow & polybar & rofi & neovim & Nitrogen & ranger"
sleep 1
sudo apt install stow polybar rofi neovim nitrogen ranger -y
pbar 52 1
banner "comman softare"
sleep 1
sudo apt-get install software-properties-common cmake -y
pbar 56 1
banner "python3 pip"
sudo apt install python3-pip -y
pbar 60 1
sudo pip3 install i3ipc
# extra all commented
banner "temp sensore"
sleep 1
#sudo apt install lm-sensors -y

#echo "Remeber gpick isinstalled for piking color"
#apt instll gpick

# --------------------- terminal randome color ------------------
cd $HOME
mkdir -p .local/bin
cd $HOME
ls git_all &> /dev/null
if [[ $? != 0 ]]; then
mkdir git_all
fi
cd git_all
rm -rfv ./*
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
sudo make install

cd $curdirgit
cd linux 
sudo ./colorscriptsroot.sh $curdirgit
cd ..
cp -v 1.jpg 2.jpg 3.jpg ~/Documents


# ----------------------------- end -----------------------------

# --------------------- add bin custum script -------------------
banner "custum script added"
cd $curdirgit
cd linux
sudo ./scripttobin $curdirgit
# ------------------------------ end ----------------------------

# ---------------------------picom jonaburg -----------------
banner picom
read -p "Do you want to install picom? [y/n] " yn

case $yn in 
        y ) 
                banner "ok , instaling picom"
		sudo apt install libxext-dev libxcb1-dev libxcb-dpms0-dev libgl-dev libegl-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson -y
		
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
pbar 71 1
# -------------------------- end picom ----------------------
# fzf # install from full

# ----------------------------------Script to add line in file ----------------
cd $curdirgit
cd linux
banner "ading line to make things work"
pbar 81 1
read -p "Do you want to install script line? [y/n] " yn

case $yn in 
	y ) 
		banner "ok, we will proceed"
		echo $PWD
		ls
		./allline.sh;;
	* ) banner "skiped";;
esac
pbar 91 1
# -------------------------------script for stow ---------------------------
cd $curdirgit
cd alldot
banner "runing Stow script"
sleep 2
pbar 95 1
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
pbar 100 1
banner "--------------------> END <-------------------- "
