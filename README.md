
#building images

docker build -t nginx -f ./nginx.Dockerfile .

docker build -t volume -f ./volume.Dockerfile .

docker build -t tomcat -f ./tomcat.Dockerfile .

#runnning containers

docker run -d --name volume .

docker run -d --name tomcat --volumes-from volume tomcat

docker run -d --name nginx -p 8080:80 --link tomcat:tomcat nginx


![alt text](https://github.com/MNTLab/docker/blob/docker-1/pavel_heraska/img/compose.png)
![alt text](https://github.com/MNTLab/docker/blob/docker-1/pavel_heraska/img/docker_preview.png)
![alt text](https://github.com/MNTLab/docker/blob/docker-1/pavel_heraska/img/simple.png)



MTN.*NIX.11 Automated Environment Configuration Management
---

***Student***: Put_Your_Name

Home Task
---

Using base docker image ***sbeliakou/centos:7.2***

1. Wiht ```Dockerfiles```:
    - Create Docker Image of ```nginx``` ([web.Dockerfile](/web.Dockerfile))
    - Create Docker Image of ```Tomcat 7``` ([tomcat.Dockerfile](/tomcat.Dockerfile))
    - Create Docker Image (Data Volume) with [```hello world```](https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war) application for Tomcat ([application.Dockerfile](application.Dockerfile))
    - Run these Images so that [http://localhost/sample](http://localhost/sample) shows ```hello world``` page
    - ```Nginx``` container forwards http requests to ```Tomcat``` container; Only ```nginx``` container exposes port (80)
2. With ```docker-compose```:
    - Create ```docker-compose.yml``` file to build containers from previos task
    - Run "environment" in daemon mode
3. Create own branch (epam login without @epam.com, in lowercase)
4. Create PR with description of reported task
6. All needed resources (if they are) must be placed into ```/resources``` folder

Task Report Notes
---
*All stuff must be provided in this section*
********************************************
