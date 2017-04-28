FROM sbeliakou/centos:7.2
EXPOSE 8080
RUN yum install -y yum-plugin-ovl java-1.7.0-openjdk wget tar unzip && \
    mkdir -p /opt/gradle && \
    wget https://services.gradle.org/distributions/gradle-3.5-bin.zip && \
    unzip -d /opt/gradle gradle-3.5-bin.zip && \
    export PATH=$PATH:/opt/gradle/gradle-3.5/bin

