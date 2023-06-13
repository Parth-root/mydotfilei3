#!/bin/bash
cd /opt/shell-color-scripts/colorscripts
rm -rfv *
cd $1
cd colorscriptsFIX
cp -rv ./* /opt/shell-color-scripts/colorscripts

