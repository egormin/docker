docker build -t web -f web/web.Dockerfile .
docker build -t tomcat -f tomcat/tomcat.Dockerfile .
docker build -t application -f application/application.Dockerfile .
docker run -d --name app application
docker run -d --name tomcat --volumes-from app tomcat
docker run -d --name proxy -p 8080:80  --link tomcat web
curl localhost:8080
