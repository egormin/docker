FROM sbeliakou/centos:7.2
VOLUME /var/lib/tomcat/webapps
ADD https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war /var/lib/tomcat/webapps/
CMD sleep infinity
