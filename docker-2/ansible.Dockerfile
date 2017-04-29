FROM sbeliakou/centos:7.2
MAINTAINER Mikalai Kuzniatsou (mikalai_kuzniatsou@epam.com)
RUN yum install -y gcc python-pip python-devel openssl-devel
RUN pip install ansible==2.2.1

