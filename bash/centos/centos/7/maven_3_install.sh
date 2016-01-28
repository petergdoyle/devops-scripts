#!/bin/sh

eval 'mvn -version' > /dev/null 2>&1
if [ $? -eq 127 ]; then
  
  mkdir /usr/maven
  #install maven
  curl -O http://www.eu.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz \
    && tar -xvf apache-maven-3.3.3-bin.tar.gz -C /usr/maven \
    && ln -s /usr/maven/apache-maven-3.3.3 /usr/maven/default \
    && rm -f apache-maven-3.3.3-bin.tar.gz

  alternatives --install "/usr/bin/mvn" "mvn" "/usr/maven/default/bin/mvn" 99999

export MAVEN_HOME=/usr/maven/default
cat >/etc/profile.d/maven.sh <<-EOF
export MAVEN_HOME=$MAVEN_HOME
EOF

else
  display_success "maven already appears to be installed. skipping."
fi
