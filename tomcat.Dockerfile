FROM sbeliakou/centos:7.2
EXPOSE 8080
RUN yum install -y yum-plugin-ovl && \
    yum install -y java-1.7.0-openjdk wget tar && \
    mkdir -p /opt/tomcat && \
    wget http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.77/bin/apache-tomcat-7.0.77.tar.gz && \
    tar xvf apache-tomcat-7.0.77.tar.gz -C /opt/tomcat && \
    ln -s /dev/stdout /opt/tomcat/apache-tomcat-7.0.77/logs/catalina.out 
CMD /opt/tomcat/apache-tomcat-7.0.77/bin/catalina.sh run
