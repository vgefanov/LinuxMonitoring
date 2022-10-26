#!/bin/bash
if [ $# -ne 0 ]
  then
    echo "Error. No parameters required"
else
  temporaryfile=$(mktemp /tmp/linuxmonitoring1.XXX)
  printf "\n" | tee -a $temporaryfile
  echo "-------------------------------------------" | tee -a $temporaryfile
  echo "HOSTNAME\t = $(hostname)" | tee -a $temporaryfile
  echo "TIMEZONE\t = $(cat /etc/timezone) $(date +"%Z" -u) $(date +"%:::z")" | tee -a $temporaryfile
  echo "USER\t\t = $(whoami)" | tee -a $temporaryfile
  echo "OS\t\t = $(uname) $(cat /etc/issue.net)" | tee -a $temporaryfile
  echo "DATE\t\t = $(date +"%d %b %Y %T")" | tee -a $temporaryfile
  echo "UPTIME\t\t = $(uptime -p | cut -b4- | tr -d [:punct:])" | tee -a $temporaryfile
  echo "UPTIME_SEC\t = $(awk -F. '{print $1}' /proc/uptime) sec" | tee -a $temporaryfile
  echo "IP\t\t = $(hostname -I | awk '{print $1}')" | tee -a $temporaryfile
  echo "MASK\t\t = $(ifconfig enp0s3 | grep inet | awk '{print $4; exit}')" | tee -a $temporaryfile
  echo "GATEWAY\t\t = $(ip r | grep default | awk '{print $3; exit}')" | tee -a $temporaryfile
  echo "RAM_TOTAL\t = $(free -b | grep Mem | awk '{printf "%.3f GB", $2/1000000000}')" | tee -a $temporaryfile
  echo "RAM_USED\t = $(free -b | grep Mem | awk '{printf "%.3f GB", $3/1000000000}')" | tee -a $temporaryfile
  echo "RAM_FREE\t = $(free -b | grep Mem | awk '{printf "%.3f GB", $4/1000000000}')" | tee -a $temporaryfile
  echo "SPACE_ROOT\t = $(df / | grep / | awk '{printf "%.2f MB", $2/1000}')" | tee -a $temporaryfile
  echo "SPACE_ROOT_USED\t = $(df / | grep / | awk '{printf "%.2f MB", $3/1000}')" | tee -a $temporaryfile
  echo "SPACE_ROOT_FREE\t = $(df / | grep / | awk '{printf "%.2f MB", $4/1000}')" | tee -a $temporaryfile
  echo "-------------------------------------------" | tee -a $temporaryfile
  printf "\n" | tee -a $temporaryfile
  sh savescript.sh $temporaryfile
  rm $temporaryfile
fi
