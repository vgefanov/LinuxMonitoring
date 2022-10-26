#!/bin/bash
colors=$(sh colorselection.sh $1 $2 $3 $4)
left_background=$(echo "$colors" | awk '{printf $1}')
left_font=$(echo "$colors" | awk '{printf $2}')
right_background=$(echo "$colors" | awk '{printf $3}')
right_font=$(echo "$colors" | awk '{printf $4}')

COLOR_NAME=$(echo "\033[${left_font}m\033[${left_background}m")
COLOR_VALUE=$(echo "\033[${right_font}m\033[${right_background}m")
CLEAR_COLOR=$(echo "\033[0m")

printf "\n"
echo "$(echo "\033[${left_font}m")-----------------$(echo "\033[${right_font}m") ------------------------${CLEAR_COLOR}"
echo "${COLOR_NAME}HOSTNAME        =${CLEAR_COLOR} ${COLOR_VALUE}$(hostname)${CLEAR_COLOR}"
echo "${COLOR_NAME}TIMEZONE        =${CLEAR_COLOR} ${COLOR_VALUE}$(cat /etc/timezone) $(date +"%Z" -u) $(date +"%:::z")${CLEAR_COLOR}"
echo "${COLOR_NAME}USER            =${CLEAR_COLOR} ${COLOR_VALUE}$(whoami)${CLEAR_COLOR}"
echo "${COLOR_NAME}OS              =${CLEAR_COLOR} ${COLOR_VALUE}$(uname) $(cat /etc/issue.net)${CLEAR_COLOR}"
echo "${COLOR_NAME}DATE            =${CLEAR_COLOR} ${COLOR_VALUE}$(date +"%d %b %Y %T")${CLEAR_COLOR}"
echo "${COLOR_NAME}UPTIME          =${CLEAR_COLOR} ${COLOR_VALUE}$(uptime -p | cut -b4- | tr -d [:punct:])${CLEAR_COLOR}"
echo "${COLOR_NAME}UPTIME_SEC      =${CLEAR_COLOR} ${COLOR_VALUE}$(awk -F. '{print $1}' /proc/uptime) sec${CLEAR_COLOR}"
echo "${COLOR_NAME}IP              =${CLEAR_COLOR} ${COLOR_VALUE}$(hostname -I | awk '{print $1}')${CLEAR_COLOR}"
echo "${COLOR_NAME}MASK            =${CLEAR_COLOR} ${COLOR_VALUE}$(ifconfig enp0s3 | grep inet | awk '{print $4; exit}')${CLEAR_COLOR}"
echo "${COLOR_NAME}GATEWAY         =${CLEAR_COLOR} ${COLOR_VALUE}$(ip r | grep default | awk '{print $3; exit}')${CLEAR_COLOR}"
echo "${COLOR_NAME}RAM_TOTAL       =${CLEAR_COLOR} ${COLOR_VALUE}$(free -b | grep Mem | awk '{printf "%.3f GB", $2/1000000000}')${CLEAR_COLOR}"
echo "${COLOR_NAME}RAM_USED        =${CLEAR_COLOR} ${COLOR_VALUE}$(free -b | grep Mem | awk '{printf "%.3f GB", $3/1000000000}')${CLEAR_COLOR}"
echo "${COLOR_NAME}RAM_FREE        =${CLEAR_COLOR} ${COLOR_VALUE}$(free -b | grep Mem | awk '{printf "%.3f GB", $4/1000000000}')${CLEAR_COLOR}"
echo "${COLOR_NAME}SPACE_ROOT      =${CLEAR_COLOR} ${COLOR_VALUE}$(df / | grep / | awk '{printf "%.2f MB", $2/1000}')${CLEAR_COLOR}"
echo "${COLOR_NAME}SPACE_ROOT_USED =${CLEAR_COLOR} ${COLOR_VALUE}$(df / | grep / | awk '{printf "%.2f MB", $3/1000}')${CLEAR_COLOR}"
echo "${COLOR_NAME}SPACE_ROOT_FREE =${CLEAR_COLOR} ${COLOR_VALUE}$(df / | grep / | awk '{printf "%.2f MB", $4/1000}')${CLEAR_COLOR}"
echo "$(echo "\033[${left_font}m")-----------------$(echo "\033[${right_font}m") -------------------------${CLEAR_COLOR}"
printf "\n"
