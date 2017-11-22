#!/bin/bash
#
# Script DEMO com Dialog que executa outros scripts de acordo com a interacao do usuario
#
# Data de criacao: 22/11/2017
# Data da ultima alteracao: 22/11/2017
#
# Joao Pacheco <pacheco@redeserv.com.br>
#

# Scripts existentes no mesmo diretorio
#
#-rw-rw-r-- 1 jmarc jmarc  789 Nov 20 04:28 install_basephp.sh                                                                                                     
#-rw-rw-r-- 1 jmarc jmarc  873 Nov 20 04:28 install_basics.sh                                                                                                      
#-rw-rw-r-- 1 jmarc jmarc  329 Nov 20 04:28 install_easyengine.sh
#-rw-rw-r-- 1 jmarc jmarc 2708 Nov 20 04:28 install_fail2ban.sh
#-rw-rw-r-- 1 jmarc jmarc  943 Nov 20 04:28 install_ftp.sh
#-rw-rw-r-- 1 jmarc jmarc  715 Nov 20 04:28 install_jailkit.sh
#-rw-rw-r-- 1 jmarc jmarc  423 Nov 20 04:28 install_mta.sh
#-rw-rw-r-- 1 jmarc jmarc 1942 Nov 20 04:28 install_postfix.sh
#-rw-rw-r-- 1 jmarc jmarc  963 Nov 20 04:28 install_quota.sh
#-rw-rw-r-- 1 jmarc jmarc  389 Nov 20 04:28 install_webserver.sh
#-rw-rw-r-- 1 jmarc jmarc  547 Nov 20 04:28 install_wordpress.sh
#-rw-rw-r-- 1 jmarc jmarc 1193 Nov 20 04:28 preinstall_check.sh

# Variaveis de ambiente
. /etc/profile

# Carregando funcoes personalizadas
. ./preinstall_check.sh

# Comandos
WHICH=/usr/bin/which
DIALOG=$(${WHICH} dialog)
CUT=$(${WHICH} cut)
REV=$(${WHICH} rev)
TEE=$(${WHICH} tee)

# Variaveis locais
SCRIPTNAME=$(echo ${0} | ${REV} | ${CUT} -d \/ -f 1 | ${REV})
PIDD=$$
PWD=$(pwd)
LOGFILE="${PWD}/${SCRIPTNAME}.log"

# Processamento principal

#PreInstallCheck
#exit 0
MENU_INSTALL=$(${DIALOG} --stdout --menu 'Opções:' 0 0 0 PreInstall 'PreInstall Check' BasePHP 'Instalando modulos do php7.1' Basics 'Instalando pacotes basicos' \
EasyEngine 'Instalando EasyEngine' Fail2Ban 'Instalando e Configurando Fail2ban' FTP 'Instalando e Configurando PureFTPd' Jailkit 'Instalando Jailkit' \
MTA 'Install chosen MTA - Dovecot' Postfix 'Instalando e Configurando Postfix' Quota 'Instalando e Configurando Disk Quota' WebServer 'Correção do Nginx' \
Wordpress 'Corrigindo incompatibilidade Wordpress')

if [ -z ${MENU_INSTALL} ]; then
	echo "Nenhum item selecionado !!!"
	echo "Abortado !!!"
	exit 1
fi 

case ${MENU_INSTALL} in
	PreInstall) PreInstallCheck >> ${LOGFILE}
			${DIALOG} --title 'PreInstallCheck' --tailbox ${LOGFILE} 0 0  				
			;;
	*) echo "Item selecionado = ${MENU_INSTALL}"
		exit 1
		;;
esac

rm ${LOGFILE}

exit 0
