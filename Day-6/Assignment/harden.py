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
current_date = datetime.now()
REPORT = "harden_report.txt"
SSH = subprocess.getoutput("sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config")

with open(REPORT, "w") as file:
    file.write("SERVER HARDENING REPORT\n")
    file.write("========================\n\n")

    file.write(f"{CYAN}Date:{RED} {current_date}\n")
    
    file.write("Root login via SSH: DISABLED\n")
