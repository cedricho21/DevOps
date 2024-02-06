#!/bin/bash

echo HOSTNAME = $(hostname)
echo TIMEZONE = $(timedatectl | grep "Time zone" | awk '{print $3}')
echo USER = $(whoami)
echo OS = $(uname) $(uname -r)
echo DATE = $(date +"%d %B %Y %T")
echo UPTIME = $(uptime -p)
echo UPTIME_SEC = $(uptime -p |awk '{print $2 * 3600 + $4 * 60}') sec
echo IP = $(hostname -I | awk '{print $1}')
echo MASK = $(ifconfig | grep $(hostname -I | awk '{print $1}') | awk '{print $4}')
echo GATEWAY = $(ip r | awk '/default/{print$3}')
echo RAM_TOTAL = $(free -h |awk '/^Mem/ {print sprintf("%.3f", $2/1000)}') GB
echo RAM_USED = $(free -h |awk '/^Mem/ {print sprintf("%.3f", $3/1000)}') GB
echo RAM_FREE = $(free -h |awk '/^Mem/ {print sprintf("%.3f", $4/1000)}') GB
echo SPACE_ROOT = $(df -BM / | awk 'NR==2 {sub(/M/, "", $2); print sprintf("%.2f", $2)}') MB
echo SPACE_ROOT_USED = $(df -BM / | awk 'NR==2 {sub(/M/, "", $3); print sprintf("%.2f", $3)}') MB
echo SPACE_ROOT_FREE = $(df -BM / | awk 'NR==2 {sub(/M/, "", $4); print sprintf("%.2f", $4)}') MB
read -p "Want to write data to a file? (Y/N): " answer
if [[ "$answer" == "y" ]] || [[ "$answer" == "Y" ]]; then
	{
            echo "HOSTNAME = $(hostname)"
            echo "TIMEZONE = $(timedatectl | grep 'Time zone' | awk '{print $3}')"
            echo "USER = $(whoami)"
            echo "OS = $(uname) $(uname -r)"
            echo "DATE = $(date +'%d %B %Y %T')"
            echo "UPTIME = $(uptime -p)"
            echo "UPTIME_SEC = $(uptime -p |awk '{print $2 * 3600 + $4 * 60}') sec"
            echo "IP = $(hostname -I | awk '{print $1}')"
            echo "MASK = $(ifconfig | grep $(hostname -I | awk '{print $1}') | awk '{print $4}')"
            echo "GATEWAY = $(ip r | awk '/default/{print$3}')"
            echo "RAM_TOTAL = $(free -h |awk '/^Mem/ {print sprintf("%.3f", $2/1000)}') GB"
            echo "RAM_USED = $(free -h |awk '/^Mem/ {print sprintf("%.3f", $3/1000)}') GB"
            echo "RAM_FREE = $(free -h |awk '/^Mem/ {print sprintf("%.3f", $4/1000)}') GB"
            echo "SPACE_ROOT = $(df -BM / | awk 'NR==2 {sub(/M/, "", $2); print sprintf("%.2f", $2)}') MB"
            echo "SPACE_ROOT_USED = $(df -BM / | awk 'NR==2 {sub(/M/, "", $3); print sprintf("%.2f", $3)}') MB"
            echo "SPACE_ROOT_FREE = $(df -BM / | awk 'NR==2 {sub(/M/, "", $4); print sprintf("%.2f", $4)}') MB"
    } > $(date +'%d_%m_%y_%H_%M_%S').status
fi
	
