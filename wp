#! /bin/bash
funcwp() {
if [ $item = 1 ]; then
if (whiptail --title "Certificado SSL" --msgbox "O DNS deve esta propagado para instalação do certificado, configure o A e Cname em seu gerenciador de DNS." 0 0 3>&1 1>&2 2>&3)
site_domain=$(whiptail --title "Entrada de nome do Domínio" --inputbox "Digite o Domínio do site:" 0 0 3>&1 1>&2 2>&3)
wp_user=$(whiptail --title "Entrada de nome do usuário" --inputbox "Digite o usuário:" 0 0 3>&1 1>&2 2>&3)	
wp_email=$(whiptail --title "Entrada de nome do Email" --inputbox "Digite o Email:" 0 0 3>&1 1>&2 2>&3)
wp_pass=$(whiptail --title "Caixa de Senha" --passwordbox "Digite a senha para o site" 0 0 3>&1 1>&2 2>&3)
wp_mod=$(whiptail --title "PHP-7.0 ou HHVM" --radiolist \
"Por Padão o EE instala o PHP-5.6 escolha uma das opções favoráveis:" 0 0 0 \
"php7" "" ON \
"hhvm" "" OFF  3>&1 1>&2 2>&3)
(whiptail --title "Criar o Site" --yesno "Certeza em criar o SITE?" 0 0 3>&1 1>&2 2>&3)
then
ee site create $site_domain --wp --le --$wp_mod --user=$wp_user --email=$wp_email --pass=$wp_pass
echo "------------------------------------------------------------------------------"
echo "                          Instalação Concluida!                               "
echo " https://$site_domain                                                         "
echo " Usuario: $wp_user                                                            "
echo " Senha: $wp_pass                                                              "
echo " EmailWordpress: $wp_email                                                    "
echo "------------------------------------------------------------------------------"
echo "${green}Aperte Enter para Voltar${NC}"
read esperar
painel
else
painel
fi
fi
}
