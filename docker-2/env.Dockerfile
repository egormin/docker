FROM sbeliakou/centos:7.2
MAINTAINER Andrei Kutsko (andrei_kutsko1@epam.com)
RUN rpm --rebuilddb && yum install -y java
RUN mkdir /var/storrage
EXPOSE 8080
CMD java -jar /var/storrage/spring-boot_application.jar 
