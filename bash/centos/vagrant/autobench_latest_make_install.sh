#!/bin/sh

eval 'autobench' > /dev/null 2>&1
if [ $? -eq 127 ]; then
  mkdir /usr/autobench
  git clone https://github.com/menavaur/Autobench.git  /usr/autobench
  cd /usr/autobench
  make \
  && make install
  if [ $? -ne 0 ]; then
    echo -e "\e[7;107;91mautobench - make did not build successfully. skipping."
  else
    echo -e "\e[7;40;92mautobench - built successfully. skipping."
  else
else
  echo -e "\e[7;40;92mautobench already appears to be downloaded. skipping."
fi
