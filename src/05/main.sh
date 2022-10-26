#!bin/bash
TIME_START=$(cat /proc/uptime | awk '{print $1}')
COLOR_RED=$(echo "\033[31m")
COLOR_BLUE=$(echo "\033[34m")
CLEAR_COLOR=$(echo "\033[0m")
if [ $# -ne 1 ]
  then
    echo "Error. Need to enter 1 parameter, you have entered $# parameters!"
else
  if [ -d $1 ] && [ "$(echo $1 | tail -c 2)" = "/" ]
    then
      echo "${COLOR_RED}Total number of folders (including all nested ones) =${COLOR_BLUE} $(find $1* -type d 2>/dev/null | wc -l)"
      echo "${COLOR_RED}TOP 5 folders of maximum size arranged in descending order (path and size):"
      echo "${COLOR_BLUE}$(find $1* -type d -exec du -ch {} + 2>/dev/null | grep -v total | sort -hr | head -5 | awk '{print NR, "-", $2"/, "$1}')"
      echo "${COLOR_RED}Total number of files =${COLOR_BLUE} $(find $1* -type f 2>/dev/null | wc -l)"
      echo "${COLOR_RED}Number of:"
      echo "Configuration files (with the .conf extension) =${COLOR_BLUE} $(find $1* -name "*.conf" 2>/dev/null | wc -l)"
      echo "${COLOR_RED}Text files =${COLOR_BLUE} $(find $1* -name "*.txt" 2>/dev/null | wc -l)"
      echo "${COLOR_RED}Executable files =${COLOR_BLUE} $(find $1* -executable -type f 2>/dev/null | wc -l)"
      echo "${COLOR_RED}Log files (with the extension .log) =${COLOR_BLUE} $(find $1* -name "*.log" 2>/dev/null | wc -l)"
      echo "${COLOR_RED}Archive files =${COLOR_BLUE} $(find $1* -name "*.rar" -o -name "*.zip" -o -name "*.tar" 2>/dev/null | wc -l)"
      echo "${COLOR_RED}Symbolic links =${COLOR_BLUE} $(find $1* -type l 2>/dev/null | wc -l)"
      echo "${COLOR_RED}TOP 10 files of maximum size arranged in descending order (path, size and type):"
      echo "${COLOR_BLUE}$(find $1* -type f -exec du -ah {} + 2>/dev/null | grep -v total | sort -hr | head -10 | awk '{print NR, "-", $2", "$1}')"
      echo "${COLOR_RED}TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
      for var in 1 2 3 4 5 6 7 8 9 10
      do
      top10=$(find $1* -executable -type f -exec du -ah {} + 2>/dev/null | sort -hr | head -$(($var)) | tail -1 | awk '{print "-", $2", "$1}')
      hash=$(find $1* -executable -type f -exec du -ah {} + 2>/dev/null | sort -hr | head -$(($var)) | tail -1 | md5sum | awk '{print $1}')
      echo "${COLOR_BLUE} $var $top10, $hash"
      done
      TIME_END="$(cat /proc/uptime | awk '{print $1}') - $TIME_START"
      TIME_WORK=$(echo $TIME_END | bc)
      printf "${COLOR_RED}Script execution time (in seconds) = ${COLOR_BLUE}%.2f\n" $TIME_WORK
  else
    echo "Normalno delai - normalno budet"
  fi
fi
