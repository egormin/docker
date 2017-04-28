FROM sbeliakou/centos:7.2
MAINTAINER ilya_khamiakou
RUN \
  yum update -y && \
  yum install -y python python-dev python-pip python-virtualenv && \

#work dir
WORKDIR /data
CMD ["bash"]
