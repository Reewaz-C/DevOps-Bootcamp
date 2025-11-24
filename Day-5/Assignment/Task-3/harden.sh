#!/bin/bash

REPORT="/home/riwaz/DevOps-Bootcamp/Day-5/Assignment/Task-3/harden_report.txt"

# Clear previous report
> $REPORT

echo "SERVER HARDENING REPORT" | tee -a $REPORT
echo "Date: $(date)" | tee -a $REPORT
echo "" | tee -a $REPORT

# 1. Disable root SSH login
sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
echo "Root login via SSH: DISABLED" | tee -a $REPORT

# 2. Change SSH port
NEW_PORT=2222
sed -i "/^#Port 22/c\Port $NEW_PORT" /etc/ssh/sshd_config
echo "SSH port changed to $NEW_PORT" | tee -a $REPORT

# Reload SSH
systemctl restart ssh
echo "SSH reloaded" | tee -a $REPORT
echo "" | tee -a $REPORT

# 3. Install fail2ban
apt-get update -y
apt-get install -y fail2ban
echo "Fail2ban installed" | tee -a $REPORT

# Basic SSH protection
cat <<EOL >/etc/fail2ban/jail.local
[sshd]
enabled = true
port = $NEW_PORT
filter = sshd
logpath = /var/log/auth.log
maxretry = 5
EOL

systemctl restart fail2ban
echo "Fail2ban configured and restarted" | tee -a $REPORT
echo "" | tee -a $REPORT

# 4. Disable unused services
for service in apache2 cups bluetooth; do
    systemctl stop $service 2>/dev/null
    systemctl disable $service 2>/dev/null
    echo "Service $service: DISABLED" | tee -a $REPORT
done
echo "" | tee -a $REPORT

# 5. Setup firewall (ufw)
ufw allow $NEW_PORT/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw --force enable
echo "Firewall configured and enabled" | tee -a $REPORT

echo ""
echo "===== HARDENING COMPLETE =====" | tee -a $REPORT
echo "Report saved at $REPORT"

