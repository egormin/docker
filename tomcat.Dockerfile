FROM sbeliakou/centos:7.2
MAINTAINER Andrei Kutsko (andrei_kutsko1@epam.com)
RUN rpm --rebuilddb && yum install -y tomcat tomcat-webapps tomcat-admin-webapps
EXPOSE 8080
CMD /usr/libexec/tomcat/server start 
