FROM sbeliakou/centos:6.7
MAINTAINER Raman Vashkevich (raman_vashkevich@epam.com)

# STEP 1. Prepare environment 

ENV JAVA_HOME /opt/java
ENV CATALINA_HOME /opt/tomcat 
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin

# STEP 2. Install Oracle Java7
# RUN yum install -y yum-plugin-ovl
RUN rpm --rebuilddb && yum install wget tar -y && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz && \
	tar -xvf jdk-7u71-linux-x64.tar.gz && \
	rm jdk*.tar.gz && \
	mv jdk* ${JAVA_HOME}


# STEP 3. Install Tomcat

RUN wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-7/v7.0.77/bin/apache-tomcat-7.0.77.tar.gz && \
	tar -xvf apache-tomcat-7.0.77.tar.gz && \
	rm apache-tomcat*.tar.gz && \
	mv apache-tomcat* ${CATALINA_HOME} 

RUN chmod +x ${CATALINA_HOME}/bin/*sh

WORKDIR /opt/tomcat

EXPOSE 8080

CMD ["catalina.sh", "run"]
