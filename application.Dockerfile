FROM sbeliakou/centos:7.2
MAINTAINER Andrei Kutsko (andrei_kutsko1@epam.com)
VOLUME /var/lib/tomcat/webapps
ADD resources/sample.war /var/lib/tomcat/webapps/
CMD sleep infinity
