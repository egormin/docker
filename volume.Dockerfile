FROM sbeliakou/centos:7.2
MAINTAINER aslesarenka
VOLUME /var/custom
ADD custom/spring-boot_application.jar /var/custom/
CMD sleep infinity

