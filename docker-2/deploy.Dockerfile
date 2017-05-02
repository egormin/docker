FROM sbeliakou/centos:7.2
ENV APP_NAME gs-spring-boot-0.1.0.jar

ADD node1/workspace/2/initial/build/libs/$APP_NAME /opt/

RUN yum install -y yum-plugin-ovl && \
    yum -y install java
CMD java -jar /opt/$APP_NAME
EXPOSE 8080
