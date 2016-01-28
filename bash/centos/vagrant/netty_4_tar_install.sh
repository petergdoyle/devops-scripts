#!/bin/sh


if [ ! -d "/usr/netty/default" ]; then
  mkdir -p /usr/netty
  curl -O -L http://dl.bintray.com/netty/downloads/netty-4.0.33.Final.tar.bz2 \
    && tar -xvf netty-4.0.33.Final.tar.bz2 -C /usr/netty \
    && ln -s /usr/netty/netty-4.0.33.Final/ /usr/netty/default \
    && rm -f netty-4.0.33.Final.tar.bz2

  export NETTY_HOME=/usr/netty/default
  cat >/etc/profile.d/netty.sh <<-EOF
export NETTY_HOME=$NETTY_HOME
EOF

  groupadd netty
  usermod -aG netty vagrant
  chown -R vagrant.netty /usr/netty/
  chmod -R g+s /usr/netty/

else
  echo -e "\e[7;40;92mnetty already appears to be downloaded. skipping."
fi
