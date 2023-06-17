#! /bin/bash
# root user chaking if root exit (root user cause $ home to / and using rm at certain location cause unbootabel system)
if [ "$(id -u)" == "0" ]; then
   echo "Running as root will cause issue EXITING !!!!!"
   exit 1
fi
#recomended package to install on new linux machine
#upgrade is going to be taking lonf as par your pc update status
#first is banner function to  display massage
clear
cd ..
curdirgit=$PWD  # save currunt dir for script to use
cd linux
#: << 'comment' # uncomment to use comment for test (for advanced user only)
# banner to print custum massage
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
if [[ $2 == 1 ]] # for smooth progress bar send 1 as arg after sending percentage
then
for (( i=$startpoint ; i<$1 ; i++ )); 
do
        pbar i 2 # 2 as arg for speed in smooth progress bar
done
fi
        let _progress=(${1}*100/100*100)/100  # Process data
        let _done=(${_progress}*10)/10 # add length
        let _left=100-$_done # progressed bar
# Build progressbar string lengths
        _done=$(printf "%${_done}s")
        _left=$(printf "%${_left}s")
tput sc # save the current cursor position
tput cup $((`tput lines`-1)) # last line in display
printf "\rProgress : [${_done// /}${_left// /}] ${_progress}%%"
if [[ $2 == 2 ]]
then
        sleep 0.02
else
sleep 1.5
fi
if [[ $1 != 100 &&  $2 != 2 ]]; then
        tput cup $((`tput lines`-1))
        echo -ne "\033[K" # curser at first in line
        tput rc
        echo -ne "\033[1A" # remove line to dont display at end when line is come to bottom
else    
        tput rc # reset curser to saved position
fi      
startpoint=$1 # save postion to use in smooth progress bar
}
#: << 'comment'  #uncomment to use comment for test (for advanced user only)

#starting instaling

pbar 1 1
banner "Startship instaling..."
sleep 1
sudo apt install curl -y &>/dev/null # curl
pbar 12 1
curl -sS https://starship.rs/install.sh | sh
sudo apt update -y
sudo apt upgrade -y
pbar 22 1
sudo apt install neofetch expect -y
pbar 31 1
banner "instaling i3 & kitty & git & screenshot"
sleep 1
sudo apt install i3 kitty git maim xclip xdotool -y  # maim xclip and xdotool for screenshot
# fzf # install from full
pbar 41 1
#kitty theam 
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
banner "instaling stow & polybar & rofi & neovim & Nitrogen & ranger"
sleep 1
sudo apt install stow polybar rofi neovim nitrogen ranger -y # ranger file manager
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
sudo apt install lm-sensors -y
banner " Run with sudo ---> sensors-detect is no temp shown to polybar"
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
banner "removing file if aleady thare"
sleep 1
rm -rfv ./*
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
sudo make install

cd $curdirgit
cd linux 
sudo ./colorscriptsroot.sh $curdirgit
cd ..
cd wallpaper
cp -v ./* ~/Documents
cd $curdirgit
cd linux 
cd fonts
mkdir ~/.fonts
cp -v ./* ~/.fonts
cd ~/.fonts
fc-cache -fv | grep "succeeded$"
if [[ $? != 0 ]]
then
banner "Fonts cache DONE"
sleep 1
fi
read -p "Is this leptop (ading user to fix Brightness not working)" yn

case $yn in 
        y ) 
                banner "Adding user in group"
		sudo apt install brightnessctl
                sudo usermod -aG video ${USER}
		;;
        * ) banner "skiped";;
esac
#----------------------------- end -----------------------------

# --------------------- add bin custum script -------------------
banner "custum script to add for direct running"
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

# ----------------------------------Script to add line in file ----------------
cd $curdirgit
cd linux
banner "Add line in bashrc and other location"
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
# running pbar for fun 
#pbar 1
#pbar 100 1
