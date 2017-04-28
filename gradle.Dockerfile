FROM sbeliakou/centos:7.2
MAINTAINER Yahor Skrabkou (yahor_skrabkou@epam.com)
RUN yum install -y yum-plugin-ovl && \
    yum install -y which zip unzip java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
    curl -s "https://get.sdkman.io" | bash && \ 
    source "/root/.sdkman/bin/sdkman-init.sh" && \
    sdk install gradle 3.5
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.131-2.b11.el7_3.x86_64/
ENV PATH /root/.sdkman/candidates/gradle/3.5/bin/:$PATH