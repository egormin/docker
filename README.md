MTN.*NIX.11 Automated Environment Configuration Management
---
_
***Student***: Put_Your_Name

Home Task
---

Using base docker image ***sbeliakou/centos:7.2***

1. Wiht ```Dockerfiles```:
- Create Docker Image of ```nginx``` ([web.Dockerfile](/web.Dockerfile))<br><br>
<i><b>web.Dockerfile:</b></i>
```web.Dockerfile
FROM sbeliakou/centos:7.2
MAINTAINER Yahor Skrabkou (yahor_skrabkou@epam.com)
RUN yum install -y nginx
COPY configs/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```
- Create Docker Image of ```Tomcat 7``` ([tomcat.Dockerfile](/tomcat.Dockerfile))<br>
    
<i><b>tomcat.Dockerfile:</b></i>
```tomcat.Dockerfile
FROM sbeliakou/centos:7.2
MAINTAINER Yahor Skrabkou (yahor_skrabkou@epam.com)
RUN yum install -y tomcat; yum clean all
EXPOSE 8080
CMD /usr/libexec/tomcat/server start 
```
- Create Docker Image (Data Volume) with [```hello world```](https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war) application for Tomcat ([application.Dockerfile](application.Dockerfile))

<i><b>application.Dockerfile:</b></i>
```application.Dockerfile
FROM sbeliakou/centos:7.2
MAINTAINER Yahor Skrabkou (yahor_skrabkou@epam.com)
RUN yum install -y wget 
RUN wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war -P /usr/share/tomcat/webapps/
VOLUME /usr/share/tomcat/webapps/
CMD sleep infinity
```
    
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
*All stuff must be provided in this section
_

<img src=pic/docker ps.png.png />
<img src=pic/docker-compose_result.png />
<img src=pic/result.png />
