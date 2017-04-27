FROM sbeliakou/centos:7.2
VOLUME /opt/tomcat/apache-tomcat-7.0.77/webapps
ADD sample.war /opt/tomcat/apache-tomcat-7.0.77/webapps/
CMD sleep infinity
