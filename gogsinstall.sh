
#!/bin/bash
## Instalando Gogs v0.11.53 no easyengine
## On Debian, Ubuntu 64Bits

# Check if user has root privileges
if [[ $EUID -ne 0 ]]; then
echo "You must run the script as root or using sudo"
   exit 1
fi

MY_IP=$(ip a s|sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}' | tr '\n' ' ')

echo -e "Set Server Name Ex: git.domain.com []: \c "
read  SERVER_FQDN

echo -e "Set Server IP Ex: $MY_IP []: \c "
read  SERVER_IP

echo "" >>/etc/hosts
echo "$SERVER_IP  $SERVER_FQDN" >>/etc/hosts
hostnamectl set-hostname $SERVER_FQDN
echo "$SERVER_FQDN" > /proc/sys/kernel/hostname

#criando site 

ee site create $SERVER_FQDN --mysql --php7 --le

#create user for gogs
adduser --disabled-login --gecos 'Gogs' git

cd 
wget --no-check-certificate -O /var/www/$SERVER_FQDN/htdocs/ https://dl.gogs.io/0.11.53/gogs_0.11.53_linux_amd64.tar.gz
tar -xvf gogs_0.11.53_linux_amd64.tar.gz && rm -f gogs_0.11.53_linux_amd64.tar.gz

#echo -e "Set Password for Gogs in Mysql Ex: gogs_password : \c "
#read  GOGS_PASS

#echo "Enter Mysql root password"
#echo "CREATE USER 'gogs'@'localhost' IDENTIFIED BY $GOGS_PASS;" >>/home/git/gogs/scripts/mysql.sql
#echo "GRANT ALL PRIVILEGES ON gogs.* TO 'gogs'@'localhost';" >>/home/git/gogs/scripts/mysql.sql 

#echo "--------------------"
mysql -p < /var/www/$SERVER_FQDN/htdocs/git/gogs/scripts/mysql.sql

chmod +x /var/www/$SERVER_FQDN/htdocs/git/gogs/gogs
mkdir -p /var/www/$SERVER_FQDN/htdocs/git/gogs/log

chown -R git:git /var/www/$SERVER_FQDN/htdocs/git/gogs
chown -R git:git /var/www/$SERVER_FQDN/htdocs/git/gogs/*


echo ""
echo "Setup Webserver Nginx"
echo "--------------------"

cp /var/www/$SERVER_FQDN/htdocs/git/gogs/scripts/systemd/gogs.service /etc/systemd/system/
sed -i 's|mysqld.service|mysqld.service mysql.service|' /etc/systemd/system/gogs.service

systemctl daemon-reload
systemctl enable gogs.service
systemctl start gogs.service


#echo 'server {
    listen          $SERVER_IP:80;
    server_name     $SERVER_FQDN;
    proxy_set_header X-Real-IP  $remote_addr; # pass on real client IP
    location / {
        proxy_pass http://localhost:3000;
    }
}' > /etc/nginx/sites-available/gogs.conf

#ln -s /etc/nginx/sites-available/gogs.conf /etc/nginx/sites-enabled/gogs.conf

#sed -i "s/YOUR_SERVER_IP/$SERVER_IP/" /etc/nginx/sites-available/gogs.conf
#sed -i "s/YOUR_SERVER_FQDN/$SERVER_FQDN/" /etc/nginx/sites-available/gogs.conf

#service nginx restart

echo ""
echo "Gogs Server App run on port 3000, Nginx on port 80"
echo "Access http://$SERVER_FQDN to continue the installation"
echo ""

echo "Screencast Install: http://www.linuxpro.com.br/2017/04/instalando-gogs-no-ubuntu/"

## Links
## http://gogs.io/docs/installation/install_from_source.html
## http://gogs.io/
## https://github.com/gogits/gogs/
## https://github.com/gogits/gogs/blob/master/conf/app.ini
view rawinstall_gogs_ubuntu.sh hosted with ❤ by GitHub
