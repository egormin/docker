FROM sbeliakou/centos:6.7
MAINTAINER Anton Kaminski (anton_kaminski@epam.com)
VOLUME /opt/apache-tomcat-8.5.14/webapps
ADD https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war /opt/apache-tomcat-8.5.14/webapps/
CMD sleep infinity
