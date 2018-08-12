#! /bin/bash

instaladores=$(whiptail --title "Menu Instaladores" --menu " Escolha uma das opções para configurar sua VPS/Dedicado." 0 0 0 \
"WP" "Instalar e Configurar VPS para Wordpress" \
"MC" "Instalar e Configurar VPS para Mautic" \
"CP" "Instalar e Configurar VPS para CyberPanel" \
"PL" "Instalar e Configurar VPS para Postal" \
"IC" "Instalar e Configurar VPS para IspConfig" \
"6" "Voltar para o Menu Principal" 3>&1 1>&2 2>&3)

###FINAL DO INSTALADORES "ITEM 1"###
##EXECUÇÃO DOS INSTALADORES###
###Instalar e Configurar VPS para Wordpress###
status=$?
case $instaladores in
WP)
wp.sh
;;
MC)
vps-mc.sh
;;
CP)
vps-cp.sh
;;
PL)
vps-pl.sh
;;
IC)
vps-ic.sh
;;
6)
status=$?
if [ $status = 0 ]; then
menu.sh
fi
if [ $status = 1 ]; then
menu02.sh
fi
;;
esac
