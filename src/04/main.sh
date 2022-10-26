#!/bin/bash
if [ $# -ne 0 ]
  then
    echo "Error. Parameters not needed"
else
  #-------------------
  #default configuration
  # 1- white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black
  column1_background=6
  column1_font_color=1
  column2_background=6
  column2_font_color=1
  #-------------------
  column1_background_default=1
  column1_font_color_default=1
  column2_background_default=1
  column2_font_color_default=1

  var=$(cat configuration.conf | grep column1_background | awk -F= '{print $2}')
  if [ $(bash isnumber.sh $var) -eq 1 ]
    then
      column1_background=$var
      column1_background_default=0
  fi
  var=$(cat configuration.conf | grep column1_font_color | awk -F= '{print $2}')
  if [ $(bash isnumber.sh $var) -eq 1 ]
    then
      column1_font_color=$var
      column1_font_color_default=0
  fi
  var=$(cat configuration.conf | grep column2_background | awk -F= '{print $2}')
  if [ $(bash isnumber.sh $var) -eq 1 ]
    then
      column2_background=$var
      column2_background_default=0
  fi
  var=$(cat configuration.conf | grep column2_font_color | awk -F= '{print $2}')
  if [ $(bash isnumber.sh $var) -eq 1 ]
    then
      column2_font_color=$var
      column2_font_color_default=0
  fi
  sh systemresearch.sh $column1_background $column1_font_color $column2_background $column2_font_color

  if [ $column1_background_default -eq 1 ]
    then
      echo "Column 1 background = default ($(sh colortext.sh $column1_background))"
    else
      echo "Column 1 background = $column1_background ($(sh colortext.sh $column1_background))"
  fi
  if [ $column1_font_color_default -eq 1 ]
    then
      echo "Column 1 font color = default ($(sh colortext.sh $column1_font_color))"
    else
      echo "Column 1 font color = $column1_font_color ($(sh colortext.sh $column1_font_color))"
  fi
  if [ $column2_background_default -eq 1 ]
    then
      echo "Column 2 background = default ($(sh colortext.sh $column2_background))"
    else
      echo "Column 2 background = $column2_background ($(sh colortext.sh $column2_background))"
  fi
  if [ $column2_font_color_default -eq 1 ]
    then
      echo "Column 2 font color = default ($(sh colortext.sh $column2_font_color))"
    else
      echo "Column 2 font color = $column2_font_color ($(sh colortext.sh $column2_font_color))"
  fi
  printf "\n"
fi
