# Task:
1. Create custom ansible (v2.2.1) image
2. Launch Jenkins from [official image](https://hub.docker.com/_/jenkins/)
3. Link Docker Host as Jenknis slave (ssh)
4. Create custom gradle image
5. Configure a job to build [spring-boot application](https://spring.io/guides/gs/spring-boot/) using gradle image buit in 3
6. Configure a job to run just built Spring Boot app with docker-compose



### Example of usage docker to isolate toolset with its dependencies:

```
# what version?
$ docker run --rm sbeliakou/ansible:2.2.1 ansible --version

# run playbook from current dir
$ alias ansible-playbook='docker run --rm -v $(pwd):$(pwd) -w $(pwd) sbeliakou/ansible:2.2.1 ansible-playbook -vv'
$ ansible-playbook playbook.yml
```

### Using Docker in Jenkinsfile
[Jenkins Docker Pipeline plugin](https://go.cloudbees.com/docs/cloudbees-documentation/cje-user-guide/index.html#docker-workflow)

```
  stage('Run Tests') {
    try {
      dir('webapp') {
        sh "mvn test"
        docker.build("sbeliakou/my_container:${env.BUILD_NUMBER}").push()
      }
    } catch (error) {

    } finally {
      junit '**/target/surefire-reports/*.xml'
    }
  }
```
---
# Ilya khamiakou
---
# 1.ANSIBLE
## Files:
[ansible.Dockerfile]( https://github.com/MNTLab/docker/blob/docker-2/ilya_khamiakou/docker-2/ansible.Dockerfile):
```docker
#connecting previously created python
FROM python
MAINTAINER ilya_khamiakou
RUN pip install ansible==2.2.1
WORKDIR /data
CMD ["bash"]
```
[python.Dockerfile]( https://github.com/MNTLab/docker/blob/docker-2/ilya_khamiakou/docker-2/python.Dockerfile):
```docker
FROM sbeliakou/centos:7.2
MAINTAINER ilya_khamiakou
RUN \
  yum update -y && \
  yum install -y python python-dev python-pip python-virtualenv && \

#work dir
WORKDIR /data
CMD ["bash"]
```
[docker-compose]( https://github.com/MNTLab/docker/blob/docker-2/ilya_khamiakou/docker-2/docker-compose.yml):
```yml
version: '3'
services:
 python:
  build:
   context: .
   dockerfile: python.Dockerfile
 ansible:
  build:
   context: .
   dockerfile: ansible.Dockerfile
depends_on: [ "python" ]
```
### List of commands used:
```docker
docker-compose up -d
docker ps -a
docker run --rm docker2_ansible ansible --version
```
## Output:
![alt tag](https://raw.githubusercontent.com/MNTLab/docker/docker-2/ilya_khamiakou/docker-2/pics/1.ansible.png)
## Ansible container usage:
```
alias ansible-playbook='docker run --rm -v $(pwd):$(pwd) -w $(pwd) ansible ansible-playbook -vv'
ansible-playbook playbook.yml
```

![alt tag](https://raw.githubusercontent.com/MNTLab/docker/docker-2/ilya_khamiakou/docker-2/pics/ansibleplaybookrun.png)
---
# Jenkins
```
docker pull jenkins
```
## Connect host as a node.
### Steps: 
 - create user jenkins
 - run: ```sudo docker exec -it jenkins bash``` >> ```ssh-keygen -t rsa```
 - copy public key to jenkins auth hosts
 - copy private key as a key and paste in "enter directly" in jenkins node config 
 ![alt tag](https://raw.githubusercontent.com/MNTLab/docker/docker-2/ilya_khamiakou/docker-2/pics/node.png)
---
# Gradle
[gradle.Dockerfile]( https://github.com/MNTLab/docker/blob/docker-2/ilya_khamiakou/docker-2/gradle.Dockerfile):
```docker
FROM sbeliakou/centos:7.2
MAINTAINER ilya_khamiakou
RUN yum install -y yum-plugin-ovl && \
    yum -y install java unzip zip which && \
    yum install git java-1.8.0-openjdk-devel -y && \
    curl -s "https://get.sdkman.io" | bash && \
    source "$HOME/.sdkman/bin/sdkman-init.sh" && \
    sdk install gradle 3.5
ENV PATH=$PATH:/root/.sdkman/candidates/gradle/current/bin 
```
 - build: ```$docker build -t gradle -f gradle.Dockerfile .``` - ok
---
#  Spring-boot application
[spring.Dockerfile]( https://github.com/MNTLab/docker/blob/docker-2/ilya_khamiakou/docker-2/spring.Dockerfile):
```docker
FROM sbeliakou/centos:7.2
MAINTAINER ilya_khamiakou
ADD gs-spring-boot-0.1.0.jar /opt/
RUN yum install -y yum-plugin-ovl && \
    yum -y install java
EXPOSE 8080
CMD java -jar /opt/gs-spring-boot-0.1.0.jar
```
---
# Spring Docker-compose
[docker-compose.yml.spring]( https://github.com/MNTLab/docker/blob/docker-2/ilya_khamiakou/docker-2/docker-compose.yml.spring):
```yml
version: '3
services:
 deploy:
    build:
      context: .
      dockerfile: spring.Dockerfile
    expose: [ "8080" ]
ports: [ "0.0.0.0:8085:8080" ]
```
# Jenkinsfiles:
 - Gradle + spring:
```Jenkinsfile
node('host ilya_khamiakou') {
  stage ('gradle build'){
       def gradle = docker.build 'gradle'
  }
  stage('Checking out') {
	git ' https://github.com/spring-guides/gs-spring-boot.git'
  }
  stage('Build application'){
        sh '''touch /opt/test/123.txt
        cd initial
        alias gradle='docker run --rm -v $(pwd):$(pwd) -w $(pwd) gradle gradle'
        gradle build
        cp build/libs/gs-spring-boot-0.1.0.jar /opt/test/
        chmod +x ${WORKSPACE}/gs-spring-boot-0.1.0.jar'''
  }
}
```
 - Spring compose:
```Jenkinsfile
node('host ilya_khamiakou') {
  stage ('dockercompose spring'){
     sh ''' cd /opt/test/
            docker-compose up -d'''
  }
}
```
