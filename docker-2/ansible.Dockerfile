FROM sbeliakou/centos:7.2
MAINTAINER Mikhail Nikolayev
#RUN yum install -y  ; yum clean all
#RUN rpm --rebuilddb && yum install yum-plugin-ovl wget tar python-devel libevent-devel python-wheel python-lxml -y ; yum clean all && \
RUN rpm --rebuilddb && yum install epel-release  yum-plugin-ovl wget python-pip gcc python-devel openssl-devel libxml2-dev libxslt-dev -y ; yum clean all && \
	# yum groupinstall "Development Tools" -y && \
	# wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz && \
	# tar -xvf setuptools-1.4.2.tar.gz && \
	# cd setuptools-1.4.2 && \
	# python2.7 setup.py install && \
	# curl https://bootstrap.pypa.io/get-pip.py | python2.7 - && \
	# pip install -U cffi && \    
	pip install --upgrade pip && \
	pip install ansible==2.2.1 && \
	ansible --version