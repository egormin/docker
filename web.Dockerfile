FROM sbeliakou/centos:7.2
RUN yum install -y nginx
EXPOSE 80
COPY resources/nginx.conf /etc/nginx/nginx.conf
CMD nginx -g "daemon off;"
