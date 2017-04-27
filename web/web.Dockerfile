FROM sbeliakou/centos:7.2
RUN yum install -y nginx
COPY web/nginx.conf /etc/nginx/conf/nginx.conf
EXPOSE 80
CMD nginx -g 'daemon off;'