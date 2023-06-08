#!/bin/bash
# Parth-root
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
sleep 0.5
tput cup $((`tput lines`-1))
echo -ne "\033[K"
tput rc
echo -ne "\033[1A"
}
#test
pbar 1
pbar 30
pbar 60
pbar 100
echo "Exit"
#below is usefull curser commadn to look forwerd
: << 'comment'
- Position the Cursor:
  \033[<L>;<C>H
     Or
  \033[<L>;<C>f
  puts the cursor at line L and column C.
- Move the cursor up N lines:
  \033[<N>A
- Move the cursor down N lines:
  \033[<N>B
- Move the cursor forward N columns:
  \033[<N>C
- Move the cursor backward N columns:
  \033[<N>D

- Clear the screen, move to (0,0):
  \033[2J
- Erase to end of line:
  \033[K

- Save cursor position:
  \033[s
- Restore cursor position:
  \033[u
comment
