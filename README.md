MTN.*NIX.11 Automated Environment Configuration Management
---

***Student***: Maksim Burakouski

Home Task 2
---

# 1. Create custom ansible (v2.2.1) image
Dockerfile for ansible - ansible.Dockerfile

Run:
  ***alias ansible-playbook='docker run --rm -v $(pwd):$(pwd) -w $(pwd) ansible ansible-playbook -vv'***
  ***ansible-playbook hello.yum***
Output:
![alt text](https://github.com/MNTLab/docker/blob/docker-2/maksim_burakouski/docker-2/pictures/ansible_run.png)

# 2. Launch Jenkins from official image
# 3. Link Docker Host as Jenknis slave (ssh)
Create user jenkins on host mashine, add public key of jenkins-master to authorized_keys jenkins-slave.
Configure jenkins node:
![alt text](https://github.com/MNTLab/docker/blob/docker-2/maksim_burakouski/docker-2/pictures/node_config.png)

# 4. Create custom gradle image
Dockerfile for gradle - gradle.Dockerfile

# 5. Configure a job to build spring-boot application using gradle image buit in 3
Pipeline script for this job - Jenkinsfile_1
Job output:
![alt text](https://github.com/MNTLab/docker/blob/docker-2/maksim_burakouski/docker-2/pictures/build_job.png)

# 6. Configure a job to run just built Spring Boot app with docker-compose
Dockerfile for deploy application - deploy.Dockerfile
Docker compose file - docker-compose.yml
Pipeline script for this job - Jenkinsfile_2
Job output:
![alt text](https://github.com/MNTLab/docker/blob/docker-2/maksim_burakouski/docker-2/pictures/deploy_job.png)

# Checking:
![alt text](https://github.com/MNTLab/docker/blob/docker-2/maksim_burakouski/docker-2/pictures/check_app.png)

