-- Securing Your Server

sudo apt update 
sudo apt install fail2ban;
sudo vim /etc/fail2ban/jail.local
[DEFAULT]
# Ban Hosts for  one hour 
bantime=3600
#override  /etc/fail2ban/jail.d/00-firewalld.conf
banaction=iptables-multiport
[sshd]
enabled=true

sudo apt install sendmail iptables-persistent
sudo service fail2ban start
sudo fail2ban-client status sshd

-- fail2ban on ubuntu 20.04
Any service that is exposed to the Internet is at risk of malware attacks. For example, if you are running a service on a publicly available network, attackers can use brute-force attempts to sign in to your account.
Fail2ban is a tool that helps protect your Linux machine from brute-force and other automated attacks by monitoring the services logs for malicious activity.
sudo apt update
sudo apt install fail2ban
sudo systemctl status fail2ban
-- Whitelist IP Addresses
ignoreip = 127.0.0.1/8 ::1 123.123.123.123 192.168.1.0/24
-- Ban Settings 
bantime  = 1d
findtime  = 10m
[sshd]
enabled   = true
maxretry  = 3
findtime  = 1d
bantime   = 4w
ignoreip  = 127.0.0.1/8 23.34.45.56

sudo systemctl restart fail2ban
fail2ban-client -h
sudo fail2ban-client status sshd
sudo fail2ban-client set sshd unbanip 23.34.45.56
sudo fail2ban-client set sshd banip 23.34.45.56

https://linuxize.com/post/install-configure-fail2ban-on-ubuntu-20-04/


-- How To Configure Firewall with UFW on Ubuntu 20.04 LTS

https://www.cyberciti.biz/faq/how-to-configure-firewall-with-ufw-on-ubuntu-20-04-lts/

-- Disabling Unneeded services
https://linuxhint.com/disable_unnecessary_services_debian_linux/#:~:text=Disabling%20Services%20in%20Debian%20and%20Ubuntu&text=If%20a%20service%20is%20disabled,name%20and%20the%20stop%20argument.




