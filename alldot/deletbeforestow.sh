#!/bin/bash
echo -e "\n"
cd ~
cd .config
cd $1
if [ $? == 0 ]
then
	rm -Rfv *
else
	echo "Not deleted anything"
fi
echo -e "\n"
