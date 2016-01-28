#!/bin/sh

eval 'mongo -version' > /dev/null 2>&1
  if [ $? -eq 127 ]; then
    cat >/etc/yum.repos.d/mongo.repo <<-EOF
[mongodb-org-3.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.0/x86_64/
gpgcheck=0
enabled=1
EOF
  yum -y install mongodb-org mongodb-org-server
  systemctl start mongod
  #chkconfig mongod on
  systemctl status mongod
  mongo -version
else
  echo -e "\e[7;40;92mmongo already appears to be installed. skipping."
fi
