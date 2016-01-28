#!/bin/sh

eval $'node --version' > /dev/null 2>&1
if [ $? -eq 127 ]; then
  #install node.js and npm
  yum -y install epel-release gcc gcc-c++ \
  && yum -y install nodejs npm

  # NPM Proxy Settings
  #npm config set proxy $HTTP_PROXY
  #vnpm config set https-proxy $HTTP_PROXY
  #useful node.js packages

  npm install format-json-stream -g
  npm install lorem-ipsum -g
  npm install forever -g
  npm install monitor-dashboard -g

else
  echo -e "\e[7;40;92mnode, npm, npm-libs already appear to be installed. skipping."
fi
