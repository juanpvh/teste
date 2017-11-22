#---------------------------------------------------------------------
# Função: InstallWebServer Debian 8
#    Correção do Nginx
#---------------------------------------------------------------------
InstallWebServer() {
    echo -n "Fazendo as correções do Nginx..."
	apt-get install nginx-common=1.10.3-10ppa~stable
    ee stack install --nginx
	echo -e "[${green}DONE${NC}]\n"
}
