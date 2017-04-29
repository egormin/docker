FROM sbeliakou/centos:7.2
RUN yum install -y yum-plugin-ovl
RUN yum install -y java-1.8.0-openjdk
COPY gs-spring-boot-0.1.0.jar /tmp/
EXPOSE 8080
CMD java -jar /tmp/gs-spring-boot-0.1.0.jar
