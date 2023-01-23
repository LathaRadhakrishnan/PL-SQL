ps aux
ps 
ps aux|grep ssh -particular processes
ps aux --sort=-pcpu,+pmem

-- Checking System Performance -Top,htop and nmon
-- Top command in linux 
sudo apt install htop
sudo apt install nmon
-- Checking the drive space usage 
df
df -k
df -m
df -T
df -t tmpfs
df -x tmpfs

-- Checking Memory usage 
free
free -h
df -h -c 5 -s 1
watch free
watch -d free
watch -n 5 -d free

-- Scheduling tasks -cron
crontab -task schedule 
