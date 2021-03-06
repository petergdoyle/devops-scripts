#!/bin/sh

eval 'java -version' > /dev/null 2>&1
if [ $? -eq 127 ]; then
  mkdir -p /usr/java
  #install java jdk 8 from oracle
  curl -O -L --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
  "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.tar.gz" \
    && tar -xvf jdk-8u60-linux-x64.tar.gz -C /usr/java \
    && ln -s /usr/java/jdk1.8.0_60/ /usr/java/default \
    && rm -f jdk-8u60-linux-x64.tar.gz

  alternatives --install "/usr/bin/java" "java" "/usr/java/default/bin/java" 99999; \
  alternatives --install "/usr/bin/javac" "javac" "/usr/java/default/bin/javac" 99999; \
  alternatives --install "/usr/bin/javaws" "javaws" "/usr/java/default/bin/javaws" 99999; \
  alternatives --install "/usr/bin/jvisualvm" "jvisualvm" "/usr/java/default/bin/jvisualvm" 99999

  export JAVA_HOME=/usr/java/default
  cat >/etc/profile.d/java.sh <<-EOF
  export JAVA_HOME=$JAVA_HOME
EOF

else
  echo -e "\e[7;40;92mjava already appears to be installed. skipping.\e[0m"
fi
