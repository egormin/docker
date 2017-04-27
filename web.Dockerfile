FROM sbeliakou/centos:6.7
RUN yum install -y nginx
RUN rm -f /etc/nginx/conf.d/default.conf
ADD resources/default.conf /etc/nginx/conf.d/default.conf
RUN ln -s /dev/stdout /var/log/nginx/access_log && \
    ln -s /dev/sdterr /var/log/nginx/error_log
EXPOSE 80
CMD nginx -g "daemon off;"