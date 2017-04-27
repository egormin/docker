FROM sbeliakou/centos:7.2
MAINTAINER ilya_khamiakou
VOLUME /opt/tomcat/webapps
ADD sample.war /opt/tomcat/webapps/
CMD sleep infinity
