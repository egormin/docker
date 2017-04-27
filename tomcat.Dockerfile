FROM sbeliakou/centos:6.7
RUN yum install -y tomcat
EXPOSE 8080
CMD service tomcat start && sleep infinity