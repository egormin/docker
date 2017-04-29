FROM sbeliakou/centos:7.2
MAINTAINER Mikalai Kuzniatsou (mikalai_kuzniatsou@epam.com)
RUN rm -f /var/lib/rpm/__db*; db_verify /var/lib/rpm/Packages; rpm --rebuilddb; yum install -y yum-plugin-ovl
RUN yum install -y unzip zip which java-1.8.0-openjdk java-1.8.0-openjdk-devel && yum clean all
RUN curl -s https://get.sdkman.io | bash && source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install gradle 3.2.1
ENV PATH=$PATH:/root/.sdkman/candidates/gradle/current/bin

