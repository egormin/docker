FROM sbeliakou/centos:7.2
MAINTAINER Mikhail Nikolayev
RUN rpm --rebuilddb && yum install -y yum-plugin-ovl && yum clean all  && \
    rpm --rebuilddb && yum -y install java-1.8.0-openjdk-devel unzip zip which git wget && yum clean all  && \
    # gradle_version=2.3 && \
    # mkdir -p /opt/gradle/ /etc/profile.d/ && \
    # wget -N http://downloads.gradle.org/distributions/gradle-${gradle_version}-all.zip && \
    # unzip -oq ./gradle-${gradle_version}-all.zip -d /opt/gradle && \
    # ln -sfnv gradle-${gradle_version} /opt/gradle/latest && \
    # printf "export GRADLE_HOME=/opt/gradle/latest\nexport PATH=\$PATH:\$GRADLE_HOME/bin" > /etc/profile.d/gradle.sh && \ 
    # . /etc/profile.d/gradle.sh && \
    # hash -r ; sync && \
    # gradle -v
    curl -s https://get.sdkman.io | bash && \
    source "/root/.sdkman/bin/sdkman-init.sh" && \
    sdk install gradle 3.5
ENV PATH=$PATH:/root/.sdkman/candidates/gradle/current/bin 