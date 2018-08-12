#!bin/sh
[ -f /bin/whiptail ] && echo -e "whiptail found: ${green}OK${NC}\n"  || apt-get -y install whiptail > /dev/null 2>&1

wget https://raw.githubusercontent.com/juanpvh/teste/master/menu.sh
wget https://raw.githubusercontent.com/juanpvh/teste/master/menu02.sh
wget https://raw.githubusercontent.com/juanpvh/teste/master/wp.sh
clear
