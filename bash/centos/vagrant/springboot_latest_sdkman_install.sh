#!/bin/sh

eval "su - vagrant -c 'spring version'" > /dev/null 2>&1
if [ $? -eq 127 ]; then
  yum -y install unzip \
  su - vagrant -c 'curl -s get.sdkman.io | bash \'
  su - vagrant -c 'printf "sdkman_auto_answer=true" > /home/vagrant/.sdkman/etc/config'
  su - vagrant -c 'sdk install springboot'
  su - vagrant -c 'source /home/vagrant/.sdkman/bin/sdkman-init.sh'
  su - vagrant -c 'sdk install springboot'
#su - vagrant -c 'sdk install groovy'     #optional
#su - vagrant -c 'sdk install grails'     #optional
else
  echo -e "\e[7;40;92mspringboot already appears to be installed. skipping."
fi
