#!/bin/bash
dir=$PWD
i=$(cat $dir/current_version) 
i=$((i+1))
echo $i
echo $i > $dir/current_version
y=v1.0$i
echo $y
git add .
git commit -m $y
git push
