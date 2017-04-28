FROM sbeliakou/centos:6.7
EXPOSE 80
RUN yum install -y nginx ; yum clean all
COPY nginx.conf /etc/nginx/nginx.conf
CMD nginx -g 'daemon off ;