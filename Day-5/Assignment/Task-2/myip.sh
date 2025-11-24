#!/bin/bash

CYAN="\e[36m"
GREEN="\e[32m"
RED="\e[31m"

clear

echo -e "${GREEN}===== MY IP INFO ====="

private_ip=$(hostname -I | awk '{print $1}')

public_ip=$(curl -s ifconfig.me)

echo -e "${CYAN}Private IP : $private_ip"
echo -e "${RED}Public IP  : $public_ip"

echo "======================"

