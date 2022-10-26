#!/bin/bash
if [ $# -ne 4 ]
  then
    echo "Error. Need to enter 4 parameter, you have entered $# parameters!"
else
  for var in "$@"
  do
  if [ $(bash isnumber.sh $var) -eq 0 ]
    then
      echo "Error. Need to enter a numeric parameter, you entered a text parameter!"
    exit
  elif [ $var -gt 6 ] || [ $var -lt 1 ]
    then
      echo "Error. The parameters must be in the range from 1 to 6."
    exit
  fi
  done
  if [ $1 -eq $2 ] || [ $3 -eq $4 ]
    then
      echo "Error. The background color and font color must be different (the first and second parameters and the third and fourth parameters must not match)."
      echo "Please try again!"
    exit
  fi
  sh systemresearch.sh $1 $2 $3 $4
fi
