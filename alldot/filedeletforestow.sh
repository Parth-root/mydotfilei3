#!/bin/bash
cd
rm $1
if [ $? == 0 ]
then
	echo "Deleted..."
else
	
	echo "Not deleted anything"
fi
