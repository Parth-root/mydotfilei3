#!/bin/bash
cd /opt/shell-color-scripts/colorscripts
rm -rfv ./*

echo "--------------------------"
echo $1
echo "--------------------------"
cd $1
cd linux/colorscriptsFIX
cp -rv ./* /opt/shell-color-scripts/colorscripts
sleep 10
