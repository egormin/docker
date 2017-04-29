FROM sbeliakou/centos:7.2
RUN yum install -y epel-release yum-plugin-ovl python-pip gcc python-devel openssl-devel  libxml2-dev libxslt-dev && pip install --upgrade pip && pip install ansible==2.2.1
