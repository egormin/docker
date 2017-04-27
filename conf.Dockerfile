FROM sbeliakou/centos:7.2
VOLUME /etc/nginx
ADD nginx.conf /etc/nginx/
CMD sleep infinity
