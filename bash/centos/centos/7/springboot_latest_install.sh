#!/bin/sh

eval "su - vagrant -c 'spring version'" > /dev/null 2>&1
if [ $? -eq 127 ]; then
  #install spring boot
  su - vagrant -c 'curl -s get.gvmtool.net | bash'
  su - vagrant -c 'printf "sdkman_auto_answer=true" > /home/vagrant/.sdkman/etc/config'
  su - vagrant -c 'sdk install springboot'
  #su - vagrant -c 'sdk install groovy'     #optional
  #su - vagrant -c 'sdk install grails'     #optional
else
  display_success "springboot already appears to be installed. skipping."
fi
