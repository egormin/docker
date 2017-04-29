FROM sbeliakou/centos:7.2
RUN yum install -y yum-plugin-ovl && \
    yum -y install java-1.8.0-openjdk-devel which wget unzip
RUN mkdir /opt/gradle/ && \
    wget https://services.gradle.org/distributions/gradle-3.5-bin.zip -O /tmp/gradle.zip && \
    unzip -d /opt/gradle /tmp/gradle.zip
ENTRYPOINT ["/opt/gradle/gradle-3.5/bin/gradle"] 
