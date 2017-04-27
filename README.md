MTN.*NIX.11 Automated Environment Configuration Management
---

***Student***: Siarhei Hreben

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
1. Commands used:

```
sudo docker build -t web -f web.Dockerfile .
sudo docker build -t tomcat -f tomcat.Dockerfile .
sudo docker build -t app -f application.Dockerfile .
sudo docker network create --driver bridge docker-1-net
sudo docker run -itd --rm --name appvolume app
sudo docker run -itd --rm --network docker-1-net -h tomcat.docker.local --name tomcat --volumes-from appvolume tomcat
sudo docker run -itd --rm --network docker-1-net -p 8080:80 -h nginx.docker.local --name nginx --link tomcat:tomcat.docker.local web
```
2. Commands used:
```
sudo docker-compose up -d

```

[docker-compose_output.txt](https://github.com/MNTLab/docker/blob/docker-1/siarhei_hreben/docker-compose_output.txt) contains command output.


![](https://github.com/MNTLab/docker/blob/docker-1/siarhei_hreben/sample_app.png)
