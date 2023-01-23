-- Generic Trouble Shooting
dmesg | less
dmesg | grep -i etho0
dmesg | grep -i usb
dmesg -c
cat /var/log/kern.log | less
cat /var/log/kern.log | grep -i 'July 20'
sudo lshw -To list hardware information
sudo lshw -C Network
sudo lshw -C USB 
sudo lshw -C Storage
sudo lspci
df -h
Dmesg -Display message command in linux 