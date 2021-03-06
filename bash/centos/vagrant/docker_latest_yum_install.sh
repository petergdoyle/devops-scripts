#!/bin/sh
eval 'docker --version' > /dev/null 2>&1
if [ $? -eq 127 ]; then
  #install docker service
  cat >/etc/yum.repos.d/docker.repo <<-EOF
  [dockerrepo]
  name=Docker Repository
  baseurl=https://yum.dockerproject.org/repo/main/centos/7
  enabled=1
  gpgcheck=1
  gpgkey=https://yum.dockerproject.org/gpg
EOF
  yum -y install docker
  systemctl start docker.service
  systemctl enable docker.service

  #allow non-#access to run docker commands for user vagrant
  #if you have problems running docker as the vagrant user on the vm (if you 'vagrant ssh'd in
  #after a 'vagrant up'), then
  #restart the host machine and ssh in again to the vm 'vagrant halt; vagrant up; vagrant ssh'
  groupadd docker
  usermod -aG docker vagrant

  #install docker-compose.
  #Compose is a tool for defining and running multi-container applications with Docker.
  yum -y install python-pip
  pip install -U docker-compose
else
  echo -e "\e[7;40;92mdocker already appears to be installed. skipping.\e[0m"
fi
