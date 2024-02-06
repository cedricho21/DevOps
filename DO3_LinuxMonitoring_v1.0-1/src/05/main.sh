#!/bin/bash

if [[ $# != 1 ]] || [[ "$1" != */ ]];then
	echo "Incorrect input"
elif [ ! -d "$directory" ]; then
	echo "No such directory"
else
start=$(date +%s.%N)
echo "Total number of folders (including all nested ones) = $(($(find $1 -type d | wc -l)-1))"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$(find $1* -type d -exec du -hs {} + | sort -rh | head -5 | nl -w1 -s' - ' | awk '{printf "%s %s %s, %s\n",$1, $2, $4, $3}')"
echo "Total number of files = $(find $1 -type f | wc -l)"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(find $1 -type f -name "*.conf" | wc -l)"
echo "Text files = $(find $1 -type f -name "*.txt" | wc -l)"
echo "Executable files = $(find $1 -type f -name "*.exe" | wc -l)"
echo "Log files (with the extension .log) = $(find $1 -type f -name "*.log" | wc -l)"
echo "Archive files = $(find $1 -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" \) | wc -l)"
echo "Symbolic links = $(find $1/ -type l | wc -l)"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$(find $1 -type f -exec sh -c 'echo -n "$(du -ah "$1") "; echo "${1##*.}"' _ {} \; | sort -rh | head -10 | nl -w1 -s' - ' | awk '{printf "%s %s %s, %s, %s\n",$1, $2, $4, $3, $5}')"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
echo "$(find $1 -type f -name "*.exe" -exec sh -c 'echo -n "$(du -ah "$1") "; md5sum "$1"' _ {} \; | sort -rh | head -10 | nl -w1 -s' - ' | awk '{printf "%s %s %s, %s, %s\n",$1, $2, $4, $3, $5}')"
end=$(date +%s.%N)
printf "Script execution time (in seconds) = %.2f\n" "$(echo "$end - $start" | bc)"
fi
