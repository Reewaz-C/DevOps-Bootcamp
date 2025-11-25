#!/bin/bash

import os
import socket
import subprocess

CYAN = "\033[36m"
RED = "\033[31m"

# Variables
private_ip = subprocess.getoutput("hostname -I | awk '{print $1}'")
public_ip = subprocess.getoutput("curl -s ifconfig.me") 

print(f"{CYAN}========== My IP =========={RED}")

print(f"{CYAN}Private IP:{RED} {private_ip}")

print(f"{CYAN}Public IP:{RED} {public_ip}")


