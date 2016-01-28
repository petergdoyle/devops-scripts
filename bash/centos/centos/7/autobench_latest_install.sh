#!/bin/sh

eval 'autobench' > /dev/null 2>&1
if [ $? -eq 127 ]; then
  mkdir /usr/autobench
  git clone https://github.com/menavaur/Autobench.git  /usr/autobench
  cd /usr/autobench
  make \
  && make install
  if [ $? -ne 0 ]; then
    display_error "curl-loader - make did not run successfully. skipping."
  else
else
  display_success "autobench already appears to be downloaded. skipping."
fi
