container_id=$(sudo docker ps -q)
sudo docker stop ${container_id}
container_id=$(sudo docker ps -a -q)
sudo docker rm ${container_id}
# sudo docker images 
# sudo docker rmi ${container_id}
