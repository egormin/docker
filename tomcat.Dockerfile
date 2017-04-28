FROM sbeliakou/centos:6.7
EXPOSE 8080
RUN yum install -y yum-plugin-ovl java-1.8.0-openjdk wget tar; yum clean all ; mkdir -p /opt/tomcat 
RUN wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-7/v7.0.77/bin/apache-tomcat-7.0.77.tar.gz && tar xvf apache-tomcat-7.0.77.tar.gz -C /opt/tomcat 
CMD /opt/tomcat/apache-tomcat-7.0.77/bin/catalina.sh run