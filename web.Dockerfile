FROM sbeliakou/centos:7.2
RUN yum install -y nginx
ADD conf/nginx.conf /etc/nginx/
EXPOSE 80
CMD nginx -g 'daemon off;'