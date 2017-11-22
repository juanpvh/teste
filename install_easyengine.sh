#---------------------------------------------------------------------
# Função: InstallBasics
#    Instalçando EasyEngine
#---------------------------------------------------------------------
InstallBasics() {
   echo -n "Instalando EasyEngine... "
  wget -qO ee rt.cx/ee && sudo bash ee
  echo -e "[${green}DONE${NC}]\n"
}
