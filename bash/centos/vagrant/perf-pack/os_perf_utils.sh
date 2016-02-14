#!/bin/sh

# some tools need to be built so need some compilers and make
yum -y install gcc gcc-c++ make

# install net-tools
yum -y net-tools

# install iperf
yum -y iperf

# install apache-bench ab
yum -y install httpd-tools

# install httpress
yum -y install httpress

# install siege
yum -y install siege

# install httperf - requires rpmforge repo
yum -y install httperf

#
# install autobench - requires httperf !
# needs a modification so that httperf hogs the resources for a benchmark
#
git clone https://github.com/menavaur/Autobench.git \
&& cd Autobench \
&& sed -i.bak 's/httperf --server/httperf --hog --server/' autobench \
&& make \
&& make install \
&& cd - \
&& rm -fr Autobench

#
# install wrk
#
yum -y install openssl-devel \
&& git clone https://github.com/wg/wrk.git \
&& cd wrk \
&& make \
&& mv wrk /usr/bin \
&& cd - \
&& rm -fr wrk

# install weighttp
yum -y install libev libev-devel \
&& git clone https://github.com/lighttpd/weighttp.git \
&& cd weighttp \
&& ./waf configure \
&& ./waf build \
&& ./waf install \
&& cd - \
&& rm -fr weighttp
