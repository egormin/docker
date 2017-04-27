FROM sbeliakou/centos:6.7
RUN yum install nginx -y
COPY resources/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD nginx -g "daemon off;"
