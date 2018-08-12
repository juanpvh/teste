#! /bin/bash
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0m' # No Color
source /usr/local/bin/menu02.sh
###MENU PRINCIPAL###
if item=$(whiptail --title "Painel de Gerenciamento de Servidor" --menu "Escolha uma opção na lista abaixo" 0 0 0 \
"1" "Instaladores" \
"2" "Painel Easyengine" \
"3" "Segurança" \
"4" "Restart mysql,nginx,PHP..." \
"5" "Monitoramento" \
"Esc" "SAIR" 3>&1 1>&2 2>&3)
then

###INSTALADORES "item 1"###
if [ $item = 1 ]; then
menu02.sh
fi
fi	
