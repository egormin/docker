FROM sbeliakou/centos:7.2
RUN yum install -y nginx
EXPOSE 80
CMD nginx -DFOREGROUND