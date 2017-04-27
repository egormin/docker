FROM sbeliakou/centos:7.2
RUN yum install -y tomcat ; yum clean all
EXPOSE 8080
CMD /usr/libexec/tomcat/server start