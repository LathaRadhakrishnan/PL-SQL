-- Creating aweb server with nginx and securing nginx
sud apt install nginx
cd /var/www/html/
sudo systemctl stop nginx
sudo systemctl start nginx
sudo systemctl restart nginx
sudo systemctl reload nginx
ufw allow http
ufw allow https

-- Secuing your web server 
HTTP,https-more secure certificate .Lets Encrypt certificate are fine.
Install cert bot.
sudo add-apt-repository ppa:certbot/certbot
sudo apt install python-certbot-nginx
/etc/nginx/sites-available
server_name www.google.com
sudo nginx -t
sudo systemctl reload nginx
sudo ufw status
sudo ufw allow 'Nginx Full'
sudo certbot --nginx -d theos-blog.com -d www.theos-blog.com
sudo certbot renew --dry-run

-- Securing Your Server -Nginx Configuarion
curl -I http://localhost
ls /etc/nginx/
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.1
uncomment server tokens off 
sudo nginx -t 
sudo service nginx reload 
sudo /etc/nginx/sites-available/
sudo vim default 
error_page 401 403 404 /404.html
location=/404.html{
    root /usr/share/nginx.html
    internal;
}
404.html
cd /usr/share/nginx/html
cat 404.html
sudo nginx -t
sudo service nginx reload
SSL Lab -Eneter te host name 


-- Hardening Your Server (Fail2ban)
cd /var/www/html
sudo vim nginx-debain
cd /etc/fail2ban
sudo vim jail.local
sudo fail2ban-client status 

