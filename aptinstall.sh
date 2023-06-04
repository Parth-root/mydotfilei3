#recomended package to install on new linux machine
#run with sudo permision
#upgrade is going to be taking lonf as par your pc update status
apt update -y
apt upgrade -y
apt install curl -y
curl -sS https://starship.rs/install.sh | sh
echo 'instaling starship to terminal'
echo 'eval "$(starship init bash)"' >> .bashrc
apt install i3 -y
apt install kitty -y
apt install git -y

#kitty theam 
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
#select theme and change name Afterglow to you convinient
cd ~/.config/kitty
ln -sf ./kitty-themes/themes/Afterglow.conf ~/.config/kitty/theme.conf
echo 'include ./theme.conf' >> kitty.conf
cd
echo 'stow to restore file'
apt install stow -y
echo 'polybar for bar on upper side in i3'
apt install polybar -y

echo 'Rofi to start application'
apt install rofi -y
echo 'comman softare'
sudo apt-get install software-properties-common
apt install neovim -y


sudo apt install python3-pip -y
pip3 install i3ipc

mkdir all_dot_file
cd all_dot_file
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
