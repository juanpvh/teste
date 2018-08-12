#! /bin/bash
source /root/wp
funinstall() {
instaladores=$(whiptail --title "Instaladores" --menu " Escolha uma das opções para configurar sua VPS/Dedicado." 0 0 0 \
"WP" "Instalar e Configurar VPS para Wordpress" \
"MC" "Instalar e Configurar VPS para Mautic" \
"CP" "Instalar e Configurar VPS para CyberPanel" \
"PL" "Instalar e Configurar VPS para Postal" \
"IC" "Instalar e Configurar VPS para IspConfig" \
"Voltar" "Voltar para o Menu Principal" 3>&1 1>&2 2>&3)

###FINAL DO INSTALADORES "ITEM 1"###
##EXECUÇÃO DOS INSTALADORES###
###Instalar e Configurar VPS para Wordpress###
case $instaladores in
WP)
wp
;;
2)
vps-mc.sh
;;
3)
vps-cp.sh
;;
4)
vps-pl.sh
;;
5)
vps-ic.sh
;;
6)
bash menu01.sh
;;
esac
}