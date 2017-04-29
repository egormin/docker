MTN.*NIX.11 Automated Environment Configuration Management
---

***Student***: Yahor Skrabkou

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
<img src='pic/docker ps.png' />
<img src=pic/docker-compose_result.png />
<img src=pic/result.png />

- ```Nginx``` container forwards http requests to ```Tomcat``` container; Only ```nginx``` container exposes port (80)

<i><b>config/nginx.conf:</b></i>
```nginx.conf
# For more information on configuration, see:
#   * Official English Documentation: http://nginx.org/en/docs/
#   * Official Russian Documentation: http://nginx.org/ru/docs/

user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

# Load dynamic modules. See /usr/share/nginx/README.dynamic.
include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

http {
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;

    server {
        listen       80 default_server;
        listen       [::]:80 default_server;
        server_name  _;
        root         /usr/share/nginx/html;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        location / {
        proxy_pass http://tomcat:8080/;
        }

        error_page 404 /404.html;
            location = /40x.html {
        }

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }
    }

# Settings for a TLS enabled server.
#
#    server {
#        listen       443 ssl http2 default_server;
#        listen       [::]:443 ssl http2 default_server;
#        server_name  _;
#        root         /usr/share/nginx/html;
#
#        ssl_certificate "/etc/pki/nginx/server.crt";
#        ssl_certificate_key "/etc/pki/nginx/private/server.key";
#        ssl_session_cache shared:SSL:1m;
#        ssl_session_timeout  10m;
#        ssl_ciphers HIGH:!aNULL:!MD5;
#        ssl_prefer_server_ciphers on;
#
#        # Load configuration files for the default server block.
#        include /etc/nginx/default.d/*.conf;
#
#        location / {
#        }
#
#        error_page 404 /404.html;
#            location = /40x.html {
#        }
#
#        error_page 500 502 503 504 /50x.html;
#            location = /50x.html {
#        }
#    }

}
```
  
  
2. With ```docker-compose```:
    - Create ```docker-compose.yml``` file to build containers from previos task
    - Run "environment" in daemon mode
    
 <i><b>docker-compose.yml:</b></i>
```docker-compose
version: '2'
services:
 application:
    build:
      context: .
      dockerfile: application.Dockerfile
 tomcat:
    build:
      context: .
      dockerfile: tomcat.Dockerfile
    depends_on: [ "application" ]
    volumes_from: [ "application" ]
    expose: [ "8080" ]
 nginx:
    build:
      context: .
      dockerfile: web.Dockerfile
    depends_on: [ "tomcat" ]
    expose: [ "80" ]   
ports: [ "0.0.0.0:8080:80" ]
```
    
3. Create own branch (epam login without @epam.com, in lowercase)
4. Create PR with description of reported task
6. All needed resources (if they are) must be placed into ```/resources``` folder

Task Report Notes
---
*All stuff must be provided in this section
_


