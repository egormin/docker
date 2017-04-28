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
<img>/pic/jenkins_result.png</img>
    
    
    
    
    
    Launch Jenkins from official image
    Link Docker Host as Jenknis slave (ssh)
    Create custom gradle image
    Configure a job to build spring-boot application using gradle image buit in 3
    Configure a job to run just built Spring Boot app with docker-compose


