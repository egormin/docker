FROM sbeliakou/centos:7.2
MAINTAINER Yahor Skrabkou (yahor_skrabkou@epam.com)
ENV APP_NAME gs-spring-boot-0.1.0.jar
ENV PATH_TO_PATH jenkins_node1/workspace/build_app/initial/build/libs

ADD $PATH_TO_PATH/$APP_NAME /tmp/

RUN yum install -y yum-plugin-ovl && \
    yum -y install java
CMD java -jar /tmp/$APP_NAME
EXPOSE 9999