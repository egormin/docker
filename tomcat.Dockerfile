FROM sbeliakou/centos:6.7

RUN rpm --rebuilddb && yum install wget tar -y

ENV JAVA_HOME /opt/java
ENV CATALINA_HOME /opt/tomcat 
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin

ENV JAVA_VERSION 7u79
ENV JAVA_BUILD 7u79-b15

# install Java
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/${JAVA_BUILD}/jdk-${JAVA_VERSION}-linux-x64.tar.gz && \
	tar -xvf jdk-${JAVA_VERSION}-linux-x64.tar.gz > /dev/null && \
	rm jdk*.tar.gz && \
	mv jdk* ${JAVA_HOME}

# install Tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.77/bin/apache-tomcat-7.0.77.tar.gz > /dev/null && \
	tar -xvf apache-tomcat-7.0.77.tar.gz > /dev/null && \
	rm apache-tomcat*.tar.gz && \
	mv apache-tomcat* ${CATALINA_HOME} 

RUN chmod +x ${CATALINA_HOME}/bin/*sh

WORKDIR /opt/tomcat

EXPOSE 8080

CMD ["catalina.sh", "run"]
