#!/bin/sh

eval 'cutter' > /dev/null 2>&1
if [ $? -eq 127 ]; then
  mkdir /usr/cutter
  curl -L -O http://www.digitage.co.uk/digitage/files/cutter/cutter-1.04.tgz
  && tar -xvf cutter-1.04.tgz -C /usr/cutter
  && ln -s /usr/cutter/cutter-1.04/ /usr/cutter/default
  && cd /usr/cutter/default
  && make
  if [ $? -ne 0 ]; then
    echo -e "\e[7;107;91mcutter - make did not run successfully. skipping.\e[0m"
  else
    alternatives --install "/usr/bin/cutter" "cutter" "/usr/cutter/default/cutter" 99999
  fi
  cd -
  rm -f cutter-1.04.tgz
else
  echo -e "\e[7;40;92mcutter already appears to be downloaded. skipping.\e[0m"
fi
