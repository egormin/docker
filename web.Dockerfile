#FROM sbeliakou/centos:7.2
#RUN yum install -y nginx
#COPY default.conf /etc/nginx/conf.d/default.conf
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
#EXPOSE 80
#CMD [ "/usr/sbin/nginx" ]

FROM sbeliakou/centos:7.2
RUN yum install -y nginx
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD nginx -g 'daemon off;'
