FROM sbeliakou/centos:6.7
VOLUME /usr/share/tomcat/webapps
ADD resources/sample.war /usr/share/tomcat/webapps/
CMD sleep infinity