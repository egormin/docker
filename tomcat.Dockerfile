FROM sbeliakou/centos:7.2
ENV CATALINA_HOME /opt/tomcat/
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME
ENV TOMCAT_URL http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-9/v9.0.0.M20/bin/apache-tomcat-9.0.0.M20.tar.gz

RUN yum install -y yum-plugin-ovl && \
    yum install -y java-1.8.0-openjdk wget && \
    wget -O /tmp/tomcat.tar.gz $TOMCAT_URL && \
    tar -xf /tmp/tomcat.tar.gz -C $CATALINA_HOME --strip 1
EXPOSE 8080
CMD $CATALINA_HOME/bin/catalina.sh run