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
Task2.
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
