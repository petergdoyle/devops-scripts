#!/bin/sh

eval '/usr/tomcat/default/bin/catalina.sh version' > /dev/null 2>&1
if [ $? -eq 127 ]; then
  mkdir -p /usr/tomcat
  curl -O http://www.eu.apache.org/dist/tomcat/tomcat-8/v8.0.28/bin/apache-tomcat-8.0.28.tar.gz \
    && tar -xvf apache-tomcat-8.0.28.tar.gz -C /usr/tomcat \
    && ln -s /usr/tomcat/apache-tomcat-8.0.28 /usr/tomcat/default \
    && rm -f apache-tomcat-8.0.28.tar.gz

    #replace the default port with the port designated for tomcat
    #sed -i.bak 's/8080/5040/' /usr/tomcat/default/conf/server.xml
    #sed -i.bak1 's/8443/5443/' /usr/tomcat/default/conf/server.xml

    curl -O http://apache.go-parts.com/tomcat/tomcat-8/v8.0.28/bin/extras/catalina-jmx-remote.jar \
      && mv catalina-jmx-remote.jar /usr/tomcat/default/lib/

  export TOMCAT_HOME=/usr/tomcat/default
  cat >/etc/profile.d/tomcat.sh <<-EOF
  export TOMCAT_HOME=$TOMCAT_HOME
EOF

  groupadd tomcat
  usermod -aG tomcat vagrant
  chown -R vagrant.tomcat /usr/tomcat/
  chmod -R g+s /usr/tomcat/

else
  echo -e "\e[7;40;92mtomcat already appears to be installed. skipping.\e[0m"
fi
