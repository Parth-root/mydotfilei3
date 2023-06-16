#!/bin/bash
dir=$PWD
i=$(cat $dir/current_version) 
i=$((i+1))
echo $i
echo $i > $dir/current_version
git add .
git commit -m "v.0$1"
git push
