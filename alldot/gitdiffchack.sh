#!/bin/bash
if [[ `git status --porcelain` ]]; then
  echo "change"
else
  echo "No changes"
fi
