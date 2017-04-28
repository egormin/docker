FROM sbeliakou/centos:7.2
RUN gradle_version=2.9 && \
    wget -N https://services.gradle.org/distributions/gradle-${gradle_version}-all.zip && \
    sudo unzip -foq gradle-${gradle_version}-all.zip -d /opt/gradle && \
    sudo ln -sfn gradle-${gradle_version} /opt/gradle/latest && \
    sudo printf "export GRADLE_HOME=/opt/gradle/latest\nexport PATH=\$PATH:\$GRADLE_HOME/bin" > /etc/profile.d/gradle.sh && \
    . /etc/profile.d/gradle.sh && \
    gradle -v
