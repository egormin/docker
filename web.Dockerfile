FROM sbeliakou/centos:7.2
MAINTAINER ilya_khamiakou
RUN yum install -y nginx
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD nginx -g "daemon off;"