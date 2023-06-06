#!/bin/bash

# Author : Teddy Skarin(OC) for progress bar and Parth-root(eficint)
function pbar {
# Process data
	let _progress=(${1}*100/100*100)/100
	let _done=(${_progress}*4)/10
	let _left=40-$_done
# Build progressbar string lengths
	_done=$(printf "%${_done}s")
	_left=$(printf "%${_left}s")
#tput civis
tput sc #save the current cursor position
tput cup $((`tput lines`-1)) 3
printf "\b\rProgress : [${_done// /#}${_left// /-}] ${_progress}%%"
tput rc
sleep 1
#tput cnorm
}


# Variables
_start=1

# This accounts as the "totalState" variable for the ProgressBar function
_end=100

# Proof of concept
sleep 1
echo lol
pbar 1 
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
