#!/usr/bin/env python3

import os
import socket
from datetime import datetime
import shutil
import psutil
import subprocess

CYAN = "\033[36m"
RED = "\033[31m"
GREEN = "\033[32m"
RESET = "\033[0m"

# variables
host_name = socket.gethostname()
up_time = os.popen('uptime -p').read()[:-1]
user_name = os.environ.get('USERNAME')
current_date = datetime.now()
PATH = "/"
Disk_use = shutil.disk_usage(PATH)  
Mem_use = os.popen('free -t -h').readlines() 
CPU_use = psutil.cpu_percent(interval=1) 
ext_ip = subprocess.getoutput("hostname -I | awk '{print $1}'")
last_login = os.system("last | head -n 3")

print(f"{CYAN}===== SERVER DASHBOARD ====={RESET}")

# Task 1
print(f"{CYAN}Hostname:{RED} {host_name}")
print(f"{CYAN}Uptime:{RED} {up_time}")

# Task 2
print(f"{CYAN}Current User:{RED} {user_name}")
print(f"{CYAN}Date:{RED} {current_date}")

# Task 3
print(f"{CYAN}Disk Usage:{RED} {Disk_use}")
print(f"{CYAN}Memory Usage:{RED} {Mem_use}")
print(f"{CYAN}CPU Usage:{RED} {CPU_use}")

# Task 4
print(f"{CYAN}External IP:{RED} {ext_ip}")

#Task 5
print(f"{CYAN} Last 3 Login:{RED} {last_login}")
