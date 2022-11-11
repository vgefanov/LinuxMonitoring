#!/bin/bash
read -r -p "Want to write data to a file? [Y/N]:" input
case $input in
  [Yy]* ) cp $1 $(date +"%d_%m_%y_%H_%M_%S").status
esac
