FROM sbeliakou/centos:6.7
ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin


RUN rpm --rebuilddb && yum install -y wget tar java-1.8.0-openjdk.x86_64
RUN wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-7/v7.0.77/bin/apache-tomcat-7.0.77.tar.gz && \
tar xvf apache-tomcat-7.0.77.tar.gz && \
rm -f apache-tomcat-7*.tar.gz && \
mv apache-tomcat* ${CATALINA_HOME}
RUN chmod a+x ${CATALINA_HOME}/bin/*.sh
WORKDIR /opt/tomcat

EXPOSE 8080
CMD ["catalina.sh", "run"] 
