FROM sbeliakou/centos:7.2
RUN yum install -y python-pip python-devel gcc epel-release yum-plugin-ovl openssl-devel && \
    pip install ansible
