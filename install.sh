#! /bin/bash
[ -f /bin/whiptail ] && echo -e "whiptail found: ${green}OK${NC}\n"  || apt-get -y install whiptail > /dev/null 2>&1
cd /usr/local/bin/
wget https://raw.githubusercontent.com/juanpvh/teste/master/menu.sh && chmod +x menu.sh
wget https://raw.githubusercontent.com/juanpvh/teste/master/menu02.sh && chmod +x menu02.sh
wget https://raw.githubusercontent.com/juanpvh/teste/master/wp.sh && chmod +x wp.sh
cd 
clear
