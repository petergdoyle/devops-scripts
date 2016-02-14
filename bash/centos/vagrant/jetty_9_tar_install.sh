#!/bin/sh


  if [ ! -d "/usr/jetty/default" ]; then
  mkdir -p /usr/jetty
  curl -O http://download.eclipse.org/jetty/stable-9/dist/jetty-distribution-9.3.7.v20160115.tar.gz \
    && tar -xvf jetty-distribution-9.3.7.v20160115.tar.gz -C /usr/jetty \
    && ln -s /usr/jetty/jetty-distribution-9.3.7.v20160115/ /usr/jetty/default \
    && rm -f jetty-distribution-9.3.7.v20160115.tar.gz

  export JETTY_HOME=/usr/jetty/default
  cat >/etc/profile.d/jetty.sh <<-EOF
export JETTY_HOME=$JETTY_HOME
# to change default port uncomment this and set port numbers: export JETTY_ARGS="jetty.http.port=5050 jetty.ssl.port=5440"
EOF

    groupadd jetty
    usermod -aG jetty vagrant
    chown -R vagrant:jetty /usr/jetty/
    chmod -R g+s /usr/jetty/

  else
    echo -e "\e[7;40;92mjetty already appears to be installed. skipping.\e[0m"
  fi
