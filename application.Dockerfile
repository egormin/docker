FROM sbeliakou/centos:7.2
MAINTAINER Yahor Skrabkou (yahor_skrabkou@epam.com)
RUN yum install -y wget 
RUN wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war -P /usr/share/tomcat/webapps/
VOLUME /usr/share/tomcat/webapps/
CMD sleep infinity