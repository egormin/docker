FROM sbeliakou/centos:7.2
MAINTAINER Mikhail Nikolayev
RUN rpm --rebuilddb &&  yum install -y yum-plugin-ovl java-1.8.0-openjdk-devel && yum clean all
EXPOSE 8080
VOLUME /opt/
ADD /home/student/docker/docker/gradle/gs-spring-boot-0.1.0.jar /opt/
CMD java -jar /opt/gs-spring-boot-0.1.0.jar