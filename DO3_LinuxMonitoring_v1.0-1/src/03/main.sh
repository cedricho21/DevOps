#!/bin/bash



print_color() {
   echo -e "\e[48;5;${1}m\e[38;5;${2}m$5\e[0m\e[48;5;${3}m\e[38;5;${4}m$6\e[0m"
}
switch_color() {
    cl=$1
    color=0
    if [ $cl == 1 ]; then 
        color=15
    elif [ $cl == 2 ]; then 
        color=9
    elif [ $cl == 3 ]; then 
        color=10
    elif [ $cl == 4 ]; then 
        color=12
    elif [ $cl == 5 ]; then 
        color=13
    elif [ $cl == 6 ]; then 
        color=0
    fi
    echo $color
}

if [[ $# != 4 ]] || ! [[ $1 =~ ^[1-6]+$ ]] || ! [[ $2 =~ ^[1-6]+$ ]] || ! [[ $3 =~ ^[1-6]+$ ]] || ! [[ $4 =~ ^[1-6]+$ ]]; then
	echo "Incorrect input"
elif [[ $1 == $2 ]] || [[ $3 == $4 ]]; then
	echo "Background and font colors are identical. Run the script with the correct parameters"
else
{
	background_name=$(switch_color $1)
	text_name=$(switch_color $2)
	background_value=$(switch_color $3)
	text_value=$(switch_color $4)

	print_color $background_name $text_name $background_value $text_value "HOSTNAME = " "$(hostname)"
	print_color $background_name $text_name $background_value $text_value "TIMEZONE = " "$(timedatectl | grep "Time zone" | awk '{print $3}')"
	print_color $background_name $text_name $background_value $text_value "USER = " "$(whoami)"
	print_color $background_name $text_name $background_value $text_value "OS = " "$(uname) $(uname -r)"
	print_color $background_name $text_name $background_value $text_value "DATE = " "$(date +"%d %B %Y %T")"
	print_color $background_name $text_name $background_value $text_value "UPTIME = " "$(uptime -p)"
	print_color $background_name $text_name $background_value $text_value "UPTIME_SEC = " "$(uptime -p |awk '{print $2 * 3600 + $4 * 60}') sec"
	print_color $background_name $text_name $background_value $text_value "IP = " "$(hostname -I | awk '{print $1}')"
	print_color $background_name $text_name $background_value $text_value "MASK = " "$(ifconfig | grep $(hostname -I | awk '{print $1}') | awk '{print $4}')"
	print_color $background_name $text_name $background_value $text_value "GATEWAY = " "$(ip r | awk '/default/{print$3}')"
	print_color $background_name $text_name $background_value $text_value "RAM_TOTAL = " "$(free -h |awk '/^Mem/ {print sprintf("%.3f", $2/1000)}') GB"
	print_color $background_name $text_name $background_value $text_value "RAM_USED = " "$(free -h |awk '/^Mem/ {print sprintf("%.3f", $3/1000)}') GB"
	print_color $background_name $text_name $background_value $text_value "RAM_FREE = " "$(free -h |awk '/^Mem/ {print sprintf("%.3f", $4/1000)}') GB"
	print_color $background_name $text_name $background_value $text_value "SPACE_ROOT = " "$(df -BM / | awk 'NR==2 {sub(/M/, "", $2); print sprintf("%.2f", $2)}') MB"
	print_color $background_name $text_name $background_value $text_value "SPACE_ROOT_USED = " "$(df -BM / | awk 'NR==2 {sub(/M/, "", $3); print sprintf("%.2f", $3)}') MB"
	print_color $background_name $text_name $background_value $text_value "SPACE_ROOT_FREE = " "$(df -BM / | awk 'NR==2 {sub(/M/, "", $4); print sprintf("%.2f", $4)}') MB"
}
fi


