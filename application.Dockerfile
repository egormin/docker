FROM sbeliakou/centos:7.2
ENV CATALINA_HOME /opt/tomcat/
VOLUME $CATALINA_HOME/webapps
ADD data/sample.war $CATALINA_HOME/webapps/
CMD sleep infinity