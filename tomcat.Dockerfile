FROM sbeliakou/centos:7.2
MAINTAINER Yahor Skrabkou (yahor_skrabkou@epam.com)
RUN yum install -y tomcat; yum clean all
EXPOSE 8080
CMD /usr/libexec/tomcat/server start 