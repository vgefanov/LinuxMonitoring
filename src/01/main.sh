#!/bin/bash
if [ $# -ne 1 ]
	then
		echo "Error. Need to enter 1 parameter, you have entered $# parameters!"
elif [ $(bash isnumber.sh $1) -eq 1 ]
	then
		echo "Error. Need to enter a text parameter, you entered a numeric parameter!"
else
	echo "$1"
fi
