FROM sbeliakou/centos:7.2
MAINTAINER ilya_khamiakou
RUN \
  yum update -y && \
  yum install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*

#work dir
WORKDIR /data
CMD ["bash"]