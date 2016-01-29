#!/bin/sh

eval 'curl-loader' > /dev/null 2>&1
if [ $? -eq 127 ]; then
  mkdir /usr/curl-loader
  curl -L -o curl-loader-0.56.tar.bz2 http://sourceforge.net/projects/curl-loader/files/latest/download?source=files \
  && bunzip2 curl-loader-0.56.tar.bz2 \
  && tar -xvf curl-loader-0.56.tar -C /usr/curl-loader \
  && ln -s /usr/curl-loader/curl-loader-0.56/ /usr/curl-loader/default

  cd /usr/curl-loader/default
  yum -y install make libcurl-devel libevent binutils gcc patch openssl-devel
  make
  if [ $? -ne 0 ]; then
    echo -e "\e[7;107;91mcurl-loader - make did not run successfully. skipping.\e[0m"
  else
    alternatives --install "/usr/bin/curl-loader" "curl-loader" "/usr/curl-loader/default/curl-loader" 99999
  fi
  cd /
  rm -f curl-loader-0.56.tar

else
  echo -e "\e[7;40;92mcurl-loader already appears to be downloaded. skipping.\e[0m"
fi
