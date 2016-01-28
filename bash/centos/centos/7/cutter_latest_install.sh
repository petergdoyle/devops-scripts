#!/bin/sh

eval 'cutter' > /dev/null 2>&1
if [ $? -eq 127 ]; then
  mkdir /usr/cutter
  curl -L -O http://www.digitage.co.uk/digitage/files/cutter/cutter-1.04.tgz
  && tar -xvf cutter-1.04.tgz -C /usr/cutter
  && ln -s /usr/cutter/cutter-1.04/ /usr/cutter/default
  && cd /usr/cutter/default
  && make
  if [ $? -ne 0 ]; then
    display_error "cutter - make did not run successfully. skipping."
  else
    alternatives --install "/usr/bin/cutter" "cutter" "/usr/cutter/default/cutter" 99999
  fi
  cd -
  rm -f cutter-1.04.tgz
else
  display_success "cutter already appears to be downloaded. skipping."
fi
