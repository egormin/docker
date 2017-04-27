FROM sbeliakou/centos:7.2
VOLUME /opt/apache-tomcat-8.5.14/webapps
ADD sample.war /opt/apache-tomcat-8.5.14/webapps/
CMD sleep infinity
