MTN.*NIX.11 Automated Environment Configuration Management
----

### DOCKER
# Task:

#### 1. Create custom ansible (v2.2.1) image

<i><b>ansible.Dockerfile:</b></i>
```ansible.Dockerfile
FROM sbeliakou/centos:7.2
MAINTAINER Yahor Skrabkou (yahor_skrabkou@epam.com)
RUN yum install -y python-pip python-devel gcc epel-release yum-plugin-ovl openssl-devel && \
    pip install ansible
```

To build:
```build
sudo docker build -t ansible -f ansible.Dockerfile .
```

#### 2.  Launch Jenkins from official image
Use command:
```jenkins.command
docker run --name myjenkins -d -p 8080:8080 -p 50000:50000 -v $(pwd)/jenkins_configs:/var/jenkins_home jenkins
```
Result:
<img src=pic/jenkins_result.png />

#### 3.  Link Docker Host as Jenknis slave (ssh)
<img src=pic/3.png />
<img src=pic/4.png />
<img src=pic/5.png />


#### 4.  Create custom gradle image
<i><b>gradle.Dockerfile:</b></i>
```gradle.Dockerfile
FROM sbeliakou/centos:7.2
MAINTAINER Yahor Skrabkou (yahor_skrabkou@epam.com)
RUN yum install -y yum-plugin-ovl && \
    yum install -y which zip unzip java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
    curl -s "https://get.sdkman.io" | bash && \ 
    source "/root/.sdkman/bin/sdkman-init.sh" && \
    sdk install gradle 3.5
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.131-2.b11.el7_3.x86_64/
ENV PATH /root/.sdkman/candidates/gradle/3.5/bin/:$PATH
```

#### 5.  Configure a job to build spring-boot application using gradle image buit in 3
<i><b>Jenkinsfile:</b></i>
<img src=pic/6.png />

<i><b>Jenkins job log:</b></i>
<img src=pic/7.png />

<i><b>Built successfully:</b></i>
<img src=pic/8.png />



    
    
    
    

    
    
    Configure a job to run just built Spring Boot app with docker-compose


