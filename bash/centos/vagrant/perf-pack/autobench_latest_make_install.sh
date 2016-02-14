#!/bin/sh


  eval "su - vagrant -c 'autobench'" > /dev/null 2>&1
  if [ $? -eq 127 ]; then
    git clone https://github.com/menavaur/Autobench.git  /tmp/autobench \
    && cd /tmp/autobench \
    && make \
    && make install
    if [ $? -ne 0 ]; then
      display_error "\e[7;107;91mautobench  - make did not run successfully. skipping.\e[0m"
    else
      su - vagrant -c autobench \
      && rm -fr /tmp/autobench
    fi
  else
    echo -e "\e[7;40;92mautobench already appears to be installed. skipping.\e[0m"
  fi
