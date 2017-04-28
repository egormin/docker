FROM sbeliakou/centos:7.2
RUN yum install -y nginx
ADD conf/nginx.conf /etc/nginx/
RUN ln -s /dev/stdout /var/log/nginx/access.log && \
    ln -s /dev/sdterr /var/log/nginx/error.log
EXPOSE 80
CMD nginx -g 'daemon off;'