#!/bin/sh

eval 'which X' > /dev/null 2>&1
if [ $? -ne 0 ]; then
  sudo yum -y groupinstall "X Window System"
  sudo yum -y groupinstall xfce
  sudo yum -y install x2goserver-xsession
  sudo yum -y install xfce4-terminal
  sudo curl -O crunchy-dark-grey.tar.gz https://dl.orangedox.com/xCs7czovfGqWuOhBgm/crunchy-dark-grey.tar.gz?dl=1
  sudo tar -xvf crunchy-dark-grey.tar.gz
  sudo mv crunchy-dark-grey /usr/share/themes
  sudo rm -f  crunchy-dark-grey.tar.gz

else
  echo -e "\e[7;40;92mX windows already appears to be installed. skipping.\e[0m"
fi
