sudo docker build -t web -f ./web.Dockerfile .
sudo docker build -t tomcat -f ./tomcat.Dockerfile .
sudo docker build -t application -f ./application.Dockerfile .

# sudo docker run -d -P --volumes-from application web