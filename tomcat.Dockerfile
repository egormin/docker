FROM sbeliakou/centos:7.2

RUN yum install -y  java-1.7.0-openjdk

RUN yum install -y tomcat ; yum clean all
EXPOSE 8080
CMD /usr/libexec/tomcat/server start


