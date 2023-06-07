#!/bin/bash
# Author : Teddy Skarin(OC) for progress bar and Parth-root(eficint)
function pbar {
	echo ""
	let _progress=(${1}*100/100*100)/100  # Process data
	let _done=(${_progress}*4)/10
	let _left=40-$_done
# Build progressbar string lengths
	_done=$(printf "%${_done}s")
	_left=$(printf "%${_left}s")
tput sc #save the current cursor position
#tput cup $((`tput lines`-1))
tput cup 1 
printf "\rProgress : [${_done// /#}${_left// /-}] ${_progress}%%"
#printf "\rProgress : [${_done// /|}${_left// /_}] ${_progress}%%"
tput rc
#tput cup $((`tput lines`-4))
#echo -e "\n"

}
#tput cup $((`tput lines`-4)) 

sleep 1
echo lol
echo 1
echo 1
echo 1
echo 1
echo ""
pbar 1
echo first
echo 1
sleep 1
echo start
echo "is new file"
pbar 20
echo lol
echo "lol"
sleep 1
pbar 50
sleep 1
echo lol
pbar 30
sleep 1
pbar 100
printf '\nFinished!\n'
tput cup $((`tput lines`-4))

