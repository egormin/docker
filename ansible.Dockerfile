FROM sbeliakou/centos:7.2
MAINTAINER aslesarenka
RUN yum install -y epel-release python2-pip gcc libffi-devel python-devel openssl-devel
RUN pip install ansible==2.2.1
