FROM sbeliakou/centos:7.2
EXPOSE 8080
RUN yum install -y yum-plugin-ovl
RUN yum install java-1.7.0-openjdk wget tar -y
RUN wget http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.77/bin/apache-tomcat-7.0.77.tar.gz
RUN mkdir -p /opt/tomcat
RUN tar xvf apache-tomcat-7.0.77.tar.gz -C /opt/tomcat
CMD /opt/tomcat/apache-tomcat-7.0.77/bin/catalina.sh run
