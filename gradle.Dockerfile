FROM sbeliakou/centos:7.2
MAINTAINER Anton Cherlyonok (anton_cherlyonok@epam.com)
RUN yum install -y yum-plugin-ovl && \
    yum install -y java unzip zip which git java-1.8.0-openjdk-devel && \
    curl -s "https://get.sdkman.io" | bash && \
    source "$HOME/.sdkman/bin/sdkman-init.sh" && \
    sdk install gradle 3.5
ENV PATH=$PATH:/root/.sdkman/candidates/gradle/current/bin
