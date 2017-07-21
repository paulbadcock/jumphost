FROM centos:latest
MAINTAINER Paul Badcock <docker@bad.co.ck>

# Setup EPEL and Nux repo
RUN yum install -y epel-release
RUN rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro && \
    rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm

# Install tools
RUN yum install -y \
    elinks \
    whois \
    net-tools \
    screen \
    bind-utils \
    openssh \
    openssh-server \
    nmap \
    ffmpeg \
    ffmpeg-devel \
  && yum clean all

# Ports to expose
EXPOSE 22

# Persistant data
VOLUME ["/data", "/scratch"]

WORKDIR /data
CMD ["/sbin/init"]
