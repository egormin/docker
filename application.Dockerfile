FROM sbeliakou/centos:7.2
VOLUME /usr/share/tomcat/webapps/
ADD sample.war /usr/share/tomcat/webapps/
CMD sleep infinity 
