FROM sbeliakou/centos:6.7
EXPOSE 80
RUN yum install -y nginx
CMD nginx -g 'daemon off;'
