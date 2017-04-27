FROM sbeliakou/centos:7.2
EXPOSE 80
RUN yum install -y nginx
COPY nginx.conf /etc/nginx/nginx.conf
CMD nginx -g 'daemon off;'
