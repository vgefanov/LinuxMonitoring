#!/bin/bash

case $1 in
	1) column1_background=107;;
	2) column1_background=41;;
	3) column1_background=42;;
	4) column1_background=44;;
	5) column1_background=45;;
	6) column1_background=40;;
esac

case $2 in
	1) column1_font_color=97;;
	2) column1_font_color=31;;
	3) column1_font_color=32;;
	4) column1_font_color=34;;
	5) column1_font_color=35;;
	6) column1_font_color=30;;
esac

case $3 in
	1) column2_background=107;;
	2) column2_background=41;;
	3) column2_background=42;;
	4) column2_background=44;;
	5) column2_background=45;;
	6) column2_background=40;;
esac

case $4 in
	1) column2_font_color=97;;
	2) column2_font_color=31;;
	3) column2_font_color=32;;
	4) column2_font_color=34;;
	5) column2_font_color=35;;
	6) column2_font_color=30;;
esac

echo "$column1_background $column1_font_color $column2_background $column2_font_color"
