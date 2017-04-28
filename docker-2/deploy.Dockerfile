FROM sbeliakou/centos:7.2
EXPOSE 8080
ADD gs-spring-boot-0.1.0.jar /opt/
RUN yum install -y yum-plugin-ovl && \
    yum -y install java
CMD java -jar /opt/gs-spring-boot-0.1.0.jar
    
