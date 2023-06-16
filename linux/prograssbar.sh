#!/bin/bash
# Parth-root
banner() {
    msg="  $*  "
    edge=$(echo "$msg" | sed 's/./-/g')
    echo -e "\n"
    echo "+$edge+"
    echo "|$msg|"
    echo "+$edge+"
    echo -e "\n"
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
        let _done=(${_progress}*4)/10
        let _left=40-$_done
# Build progressbar string lengths
        _done=$(printf "%${_done}s")
        _left=$(printf "%${_left}s")
tput sc #save the current cursor position
tput cup $((`tput lines`-1))
printf "\rProgress : [${_done// /#}${_left// /-}] ${_progress}%%"
if [[ $2 == 2 ]]
then
	sleep 0.01
else
sleep 1.5
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



banner test
pbar 5 1
tree
pbar 30 1
sleep 1
tree
pbar 60 1
tree
pbar 100 1
tree
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
