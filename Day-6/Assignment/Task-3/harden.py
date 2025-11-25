#!/usr/bin/env python3

import os
import socket
from datetime import datetime
import shutil
import psutil
import subprocess
import fileinput

CYAN = "\033[36m"
RED = "\033[31m"
GREEN = "\033[32m"
RESET = "\033[0m"

# variables
current_date = datetime.now()
REPORT = "harden_report.txt"
New_port = "2222"
services = ["apache2", "cups", "bluetooth"]

# ----------  HEADRER   ---------------------------
with open(REPORT, "a") as file:
    file.write("SERVER HARDENING REPORT\n")
    file.write("========================\n\n")

# ----------  DATE   ---------------------------

with open(REPORT, "a") as file:
    file.write(f"{CYAN}Date:{RED} {current_date}\n\n")

# ----------  SSH   ---------------------------
for line in fileinput.input("/etc/ssh/sshd_config", inplace=True):
    print(line.replace("PermitRootLogin yes", "PermitRootLogin no"),end="")
with open(REPORT, "a") as file:
    file.write("Root login via SSH: DISABLED\n\n")

# ----------  SSH port change   ---------------------------
for line in fileinput.input("/etc/ssh/sshd_config", inplace=True):
    if line.strip().startswith("#Port 22"):
        print(f"Port {New_port}")
    else:
        print(line, end="")

with open(REPORT, "a") as file:
    file.write("SSH port changed to 2222\n\n")

# ----------  Reload SSH   ---------------------------
subprocess.run(["sudo", "systemctl", "restart", "ssh"], check=True)
with open(REPORT, "a") as file:
    file.write("SSH is reloaded !!\n\n")

# ----------  Install faile2ban   ---------------------------
subprocess.run(["sudo", "apt-get", "update", "-y"], check=True)
subprocess.run(["sudo", "apt-get", "install", "-y", "fail2ban"], check=True)
with open(REPORT, "a") as file:
    file.write("Fail2ban is installed !!!\n\n")

# ----------  SSH Protection in fail2ban  -------------------------
content = f"""[sshd]
enabled = true
port = $NEW_PORT
filter = sshd
logpath = /var/log/auth.log
maxretry = 5
"""
with open("/etc/fail2ban/jail.local", "w") as file:
    file.write(content)
with open(REPORT, "a") as file:
    file.write("Faile2ban jail.local configured.")

# ------------ Faile2ban restart -----------------------------
subprocess.run(["sudo", "systemctl", "restart", "fail2ban"], check=True)
with open(REPORT, "a") as file:
    file.write("Fail2ban is restarted !!\n\n")

# ----------  Disable unused services   ---------------------------

for service in services:
    # Stop service
    subprocess.run(["systemctl", "stop", service], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

with open(REPORT, "a") as file:
    file.write(f"Service {service}: DISABLED\n\n")

# ----------  Update Firewall   ---------------------------
subprocess.run(["ufw", "allow", "80/tcp"], check=True)
subprocess.run(["ufw", "allow", "443/tcp"], check=True)

subprocess.run(["ufw", "--force", "enable"], check=True)

with open(REPORT, "a") as file:
    file.write(f"Firewall configured and enabled")

# ----------  HARDENING COMPLETE   ---------------------------
with open(REPORT, "a") as file:
    file.write(f"Hardening Completed and report saved !!!")
