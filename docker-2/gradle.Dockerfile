FROM sbeliakou/centos:7.2
RUN yum install -y yum-plugin-ovl
RUN yum install -y which zip unzip java-1.8.0-openjdk
RUN curl -s "https://get.sdkman.io" | bash
RUN source "/root/.sdkman/bin/sdkman-init.sh" && sdk install gradle 3.5
ENV PATH /root/.sdkman/candidates/gradle/3.5/bin/:$PATH
