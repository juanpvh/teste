#---------------------------------------------------------------------
# Função: PreInstallCheck
#    fazendo algumas pré verificações
#---------------------------------------------------------------------
PreInstallCheck() {
  # Verifique se o usuário é root
  if [ $(id -u) != "0" ]; then
    echo -n "	."
    exit 1
  fi
  
  # Verifique a conectividade
  echo -n "Checando conexão com a internet... "
  ping -q -c 3 www.google.com > /dev/null 2>&1

  if [ ! "$?" -eq 0 ]; then
        echo -e "${red}ERROR: Não conseguir acessar www.google.com, verifique sua conexãocom a internet${NC}"
        exit 1;
  fi
  
  
  # Check source.list
  contrib=$(cat /etc/apt/sources.list | grep contrib | grep -v "cdrom")
  nonfree=$(cat /etc/apt/sources.list | grep non-free | grep -v "cdrom")
  if [ -z "$contrib" ]; then
        if [ -z "$nonfree" ]; then
                sed -i 's/main/main contrib non-free/' /etc/apt/sources.list;
        else
                sed -i 's/main/main contrib/' /etc/apt/sources.list;
        fi
  else
        if [ -z "$nonfree" ]; then
                sed -i 's/main/main non-free/' /etc/apt/sources.list;
        fi
  fi
  echo -e "${green} OK${NC}\n"
}


