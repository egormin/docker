FROM sbeliakou/centos:7.2
ADD gs-spring-boot-0.1.0.jar /tmp
RUN yum install -y yum-plugin-ovl && \
    yum -y install java-1.8.0-openjdk
EXPOSE 8080

CMD java -jar /tmp/gs-spring-boot-0.1.0.jar