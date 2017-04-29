FROM sbeliakou/centos:7.2
RUN yum install -y yum-plugin-ovl && yum -y install java unzip zip which && yum install git java-1.8.0-openjdk-devel -y && curl -s "https://get.sdkman.io" | bash && \
    source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install gradle 3.5
ENV PATH=$PATH:/root/.sdkman/candidates/gradle/current/bin   
