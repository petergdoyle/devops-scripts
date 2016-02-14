#!/bin/sh

  if [ ! -d "/usr/jmeter/default" ]; then
  mkdir -p /usr/jmeter
  curl -O http://www.eu.apache.org/dist/jmeter/binaries/apache-jmeter-2.13.tgz \
    && tar -xvf apache-jmeter-2.13.tgz -C /usr/jmeter \
    && ln -s /usr/jmeter/apache-jmeter-2.13 /usr/jmeter/default \
    && rm -f apache-jmeter-2.13.tgz

  export JMETER_HOME=/usr/jmeter/default
  cat >/etc/profile.d/jmeter.sh <<-EOF
export JMETER_HOME=$JMETER_HOME
EOF

  else
    echo -e "\e[7;40;92mjmeter already appears to be installed. skipping.\e[0m"
  fi
