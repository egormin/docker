FROM sbeliakou/centos:7.2
MAINTAINER ilya_khamiakou
ADD gs-spring-boot-0.1.0.jar /opt/
RUN yum install -y yum-plugin-ovl && \
    yum -y install java
EXPOSE 8080
CMD java -jar /opt/gs-spring-boot-0.1.0.jar
