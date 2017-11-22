#---------------------------------------------------------------------
# Função: InstallWordpess
#    Corrigindo incompatibilidade Wordpress
#---------------------------------------------------------------------
Installwordpress() {
  echo -n "Corrindo incompatibilidade Wordpress com o Easyengine... ";
  sudo ee stack remove --wpcli
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  sudo mv wp-cli.phar /usr/local/bin/wp
  wp cli update --nightly
  echo -e "[${green}DONE${NC}]\n"
}

