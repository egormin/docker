FROM sbeliakou/centos:6.7
MAINTAINER Anton Kaminski (anton_kaminski@epam.com)

ENV CATALINA_HOME /opt/apache-tomcat-8.5.14
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin


RUN yum install -y java-1.7.0-openjdk-devel.x86_64 wget tar ; yum clean all
RUN wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-8/v8.5.14/bin/apache-tomcat-8.5.14.tar.gz
RUN tar xvf apache-tomcat-8.5.14.tar.gz -C /opt
RUN chmod +x ${CATALINA_HOME}/bin/*sh

EXPOSE 8080

CMD ["/opt/apache-tomcat-8.5.14/bin/catalina.sh", "run"]