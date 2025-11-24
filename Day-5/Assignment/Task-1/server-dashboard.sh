#!/bin/bash

CYAN="\e[36m"
RED="\e[31m"
GREEN="\e[32m"
clear

echo -e "${CYAN}===== SERVER DASHBOARD =====${RED}"

# Server name & uptime
echo -e "${CYAN}Hostname:${RED} $(hostname)"
echo -e "${CYAN}Uptime:${RED} $(uptime -p)"

echo
echo -e "${CYAN}User:${RED} $USER"
echo -e "${CYAN}Date:${RED} $(date)"

echo
echo -e "${CYAN}Disk Usage:${RED}"
df -h | awk 'NR==1 || /\/$/'

echo
echo -e "${CYAN}Memory Usage:${RED}"
free -h

echo
echo -e "${CYAN}CPU Load:${RED}"
cat /proc/loadavg

echo
echo -e "${CYAN}External IP:${GREEN}"
curl -s ifconfig.me

echo
echo -e "${CYAN}Last 3 Login Attempts:${GREEN}"
last -n 3

echo "============================"

