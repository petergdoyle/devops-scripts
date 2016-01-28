#!/bin/sh

eval "nginx -v" > /dev/null 2>&1
if [ $? -eq 127 ]; then
  yum -y install nginx

  #replace the default port with the port designated for nginx
  sed -i.bak 's/80 default_server/5000 default_server/' /etc/nginx/nginx.conf

else
  echo -e "\e[7;40;92mnginx already appears to be installed. skipping."
fi
