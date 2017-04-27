FROM sbeliakou/centos:7.2
MAINTAINER Andrei Kutsko (andrei_kutsko1@epam.com)
RUN yum install -y nginx 
COPY resources/nginx.conf /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 80
CMD [ "/usr/sbin/nginx" ]
