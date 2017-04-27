FROM sbeliakou/centos:7.2
RUN yum install -y epel-release
RUN yum install -y yum-plugin-ovl
RUN yum install -y nginx
RUN rm /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/
EXPOSE 80
CMD nginx -g 'daemon off;'
