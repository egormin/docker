FROM sbeliakou/centos:7.2
MAINTAINER Mikalai Kuzniatsou (mikalai_kuzniatsou@epam.com)
RUN yum install -y gcc python-pip python-devel openssl-devel openssh-server openssh-clients
RUN pip install ansible==2.2.1
COPY ansible/ansible.cfg /etc/ansible/ansible.cfg
COPY ansible/inventory /etc/ansible/hosts
