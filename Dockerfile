FROM sbeliakou/centos:6.7
RUN yum install -y httpd web-assets-httpd
EXPOSE 80
CMD httpd -DFOREGROUND

