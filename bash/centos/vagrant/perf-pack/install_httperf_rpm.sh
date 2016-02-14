#!/bin/sh

  eval 'httperf' > /dev/null 2>&1
    if [ $? -eq 127 ]; then
    curl -L -O http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm \
    && yum -y localinstall rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm \
    && yum -y install httperf \
    && rm -f rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
  else
    echo -e "\e[7;40;92mhttperf already appears to be installed. skipping.\e[0m"
  fi
