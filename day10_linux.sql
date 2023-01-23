-- Trouble shooting Motherboard
Chack RAM is placed correctly,CMOS battery and so on.
-- Memory Test
Using memtest86+ to test memory in system.Run it for overnight.
Using memtester to test RAM memory sudo apt-get install memtester
memtester 1GB memtester 256MB 

-- CPU stress testing using mprime
wget http://www.codyraymiller.com/mprime/mprime259-linux64.tar.gz
tar -xzvf mprime259-linux64.tar.gz
sudo ./mprime

-- Testing PSU(Power Supply Unit)
Power Supply Unit-Test cables had good firm connection with Motherboard

-- Using fsck to check and Repair Filesystem Errors
sudo fsck -l
sudo parted -l 
man fsck

-- Checking the S.M.A.R.T status of HDD in ubuntu server
sudo smartctl /dev/sdb -a/-x| less

-- Networking Basics
ifconfig
ping google.com
sudo apt-get install links
links ctrl+G

-- Releasing and Renewing DHCP release
sudo dhclient -r etho0 -release
sudo dhclient etho0-renew
ifconfig

-- Static IP configurations and adapter Resets
Ubuntu Desktop network is managed network manager 
Ubuntu server network is managed by network 
cat /etc/network/interfaces
iface eth0 inet DHCP
iface eth0 inet static 
address 10.0.0.17
netmask 255.255.255.0
gateway 10.0.0.1
sudo ifdown eth0
ifconfig
sudo ifup eth0
ifconfig
ping google.com

-- Wireless Connection

sudo nano /etc/network/interfaces
 #wireless adapter
 auto wlan0
 iface wlan0 inet static 
  address 10.0.0.17
  netmask 255.255.255.0
  gateway 10.0.0.1
  wpa-ssid miller
  wpa-psk password
sudo ifup wlan0
sudo ifdown wlan0

-- Verifying and changing the hostname 
hostname 
sudo hostname newhost
sudo nano /etc/hostname 
sudo nano /etc/hosts
sudo etc/init.d/networking restart 

-- Calling Up the ARP(Address Resolution Protocol) Table
arp -a
 ping 10.0.0.17
 arp -a

--  Using lshw to view network adapter information
sudo lshw -C network 
sudo ifconfig eth0 down
sudo lshw -C network 
sudo ifconfig eth0 up
sudo lshw -C network 

-- Testing Download Speed with wget
wget http://www.codyraymiller.com/speedtest/speedtest.wmv

sudo apt-get install python-pip
sudo pip install speedtest-cli
speedtest-cli




























