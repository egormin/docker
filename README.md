MTN.*NIX.11 Automated Environment Configuration Management
----

### DOCKER
# Task:

#### 1. Create custom ansible (v2.2.1) image
<i><b>ansible.Dockerfile:</b></i>
FROM sbeliakou/centos:7.2
MAINTAINER Yahor Skrabkou (yahor_skrabkou@epam.com)
RUN yum install -y python-pip python-devel gcc epel-release yum-plugin-ovl openssl-devel && \
    pip install ansible

To build:
sudo docker build -t ansible -f ansible.Dockerfile .



    #1. Create custom ansible (v2.2.1) image
    
    
    
    
    
    Launch Jenkins from official image
    Link Docker Host as Jenknis slave (ssh)
    Create custom gradle image
    Configure a job to build spring-boot application using gradle image buit in 3
    Configure a job to run just built Spring Boot app with docker-compose


