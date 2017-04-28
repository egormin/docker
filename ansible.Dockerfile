FROM sbeliakou/centos:7.2
MAINTAINER Yahor Skrabkou (yahor_skrabkou@epam.com)
RUN yum install -y python-pip python-devel gcc epel-release yum-plugin-ovl openssl-devel && \
    pip install ansible