FROM sbeliakou/centos:7.2
MAINTAINER Andrei Kutsko (andrei_kutsko1@epam.com)
VOLUME /var/storrage
ADD storrage/spring-boot_application.jar /var/storrage/
CMD sleep infinity
