FROM sbeliakou/centos:7.2
RUN yum install -y yum-plugin-ovl
RUN yum install -y java-1.8.0-openjdk
ADD apache-tomcat-8.5.14.tar.gz /opt
WORKDIR /opt
RUN groupadd tomcat
RUN useradd -s /bin/bash -g tomcat -d /opt/apache-tomcat-8.5.14 tomcat
EXPOSE 8080
CMD /opt/apache-tomcat-8.5.14/bin/catalina.sh run
