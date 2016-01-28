#!/bin/sh

eval "httpd -v" > /dev/null 2>&1
if [ $? -eq 127 ]; then
  yum -y install httpd php

  #replace the default port with the port designated for apache httpd
  #sed -i.bak 's/Listen 80/Listen 5010/' /etc/httpd/conf/httpd.conf

  cat >/var/www/html/info.php <<-EOF
<?php
phpinfo();
?>
EOF

else
  echo -e "\e[7;40;92mhttpd already appears to be installed. skipping."
fi
