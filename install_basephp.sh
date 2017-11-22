#---------------------------------------------------------------------
# Função: InstallBasePhp Debian 8
#    instalando modulos do php7.1
#---------------------------------------------------------------------
InstallBasePhp(){
  echo -n "Instalando modulo do php7.1..."
  apt-get -y install php7.1 php7.1-common php7.1-cli php7.1-cgi php7.1-xsl php7.1-fpm php7.1-mysql php7.1-gd php7.1-imap php-pear php7.1-mcrypt php7.1-curl php7.1-intl php7.1-pspell php7.1-recode php7.1-sqlite3 php7.1-tidy php7.1-xmlrpc php7.1-zip php7.1-mbstring php7.1-imap php7.1-mcrypt php7.1-snmp php7.1-xmlrpc php7.1-xsl > /dev/null 2>&1
  apt-get -y install php7.1-apc php7.1-bcmath php7.1-bz2 php7.1-dba php7.1-dom php7.1-mysqli php7.1-mysqlnd php7.1-soap > /dev/null 2>&1
  echo -e "[${green}DONE${NC}]\n"
}