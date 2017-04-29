FROM sbeliakou/centos:7.2
MAINTAINER Anton Cherlyonok (anton_cherlyonok@epam.com)
RUN yum install -y epel-release yum-plugin-ovl gcc python-pip  python-devel openssl-devel  libxml2-dev libxslt-dev && \
    pip install --upgrade pip && \
    pip install ansible==2.2.1
