FROM sbeliakou/centos:7.2
MAINTAINER ilya_khamiakou

ENV JAVA_HOME /opt/java
ENV CATALINA_HOME /opt/tomcat 
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin

#fixing errors with checksums
RUN rpm --rebuilddb && yum install wget tar -y && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz && \
	tar -xvf jdk-7u71-linux-x64.tar.gz && \
	rm jdk*.tar.gz && \
	mv jdk* ${JAVA_HOME}


# Install Tomcat
RUN rpm --rebuilddb && wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-7/v7.0.77/bin/apache-tomcat-7.0.77.tar.gz && \
	tar -xvf apache-tomcat-7.0.77.tar.gz && \
	rm apache-tomcat*.tar.gz && \
	mv apache-tomcat* ${CATALINA_HOME} 

RUN chmod +x ${CATALINA_HOME}/bin/*sh

WORKDIR /opt/tomcat

EXPOSE 8080

CMD ["catalina.sh", "run"]