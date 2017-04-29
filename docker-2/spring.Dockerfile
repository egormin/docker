FROM sbeliakou/centos:7.2
MAINTAINER Mikalai Kuzniatsou (mikalai_kuzniatsou@epam.com)
RUN yum install -y yum-plugin-ovl
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel
EXPOSE 8080
EXPOSE 12550
EXPOSE 12551
VOLUME /opt/
ADD resources/gs-spring-boot.jar /opt/
CMD java -Djava.rmi.server.hostname=epbyminw6405.minsk.epam.com \
  -Dcom.sun.management.jmxremote \
  -Dcom.sun.management.jmxremote.port=12550 \
  -Dcom.sun.management.jmxremote.rmi.port=12551 \
  -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.ssl=false \
  -jar /opt/gs-spring-boot.jar
