sudo docker build -t nginx -f ./web.Dockerfile .
sudo docker build -t tomcat -f ./tomcat.Dockerfile .
sudo docker build -t application -f ./application.Dockerfile .
sudo docker run --name application-cont -d application
sudo docker run --name tomcat-cont --volumes-from application-cont --name tomcat-cont -p 8082:8080 -d tomcat
sudo docker run --name nginx-cont -p 80:80 --link tomcat-cont:tomcat-cont -d nginx
