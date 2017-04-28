FROM sbeliakou/centos:7.2
MAINTAINER aslesarenka
RUN rpm --rebuilddb && yum install -y java
RUN mkdir /var/custom
EXPOSE 8080
CMD java -jar /var/custom/spring-boot_application.jar 
