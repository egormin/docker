# Workflow:

1. Create custom ansible (v2.2.1) image.
    ### docker build -t ansible -f ansible.Dockerfile . 
2. Launch Jenkins from official image.
  - ### docker run -p 8080:8080 -p 50000:50000 jenkins
  - ### alias ansible-playbook='docker run --rm -v $(pwd):$(pwd) -w $(pwd) sbeliakou/ansible:2.2.1 ansible-playbook -vv'
  - ### ansible-playbook playbook.yml
3. Link Docker Host as Jenknis slave (ssh).
   Create user (jenkins) on host, public-key (host) => authorized_keys (slave) 
4. Create custom gradle image.
5. Configure a job to build spring-boot application using gradle image buit in 3.
6. Configure a job to run just built Spring Boot app with docker-compose

Example of usage docker to isolate toolset with its dependencies:

#### what version?
$ docker run --rm sbeliakou/ansible:2.2.1 ansible --version
#### run playbook from current dir
$ alias ansible-playbook='docker run --rm -v $(pwd):$(pwd) -w $(pwd) sbeliakou/ansible:2.2.1 ansible-playbook -vv'
$ ansible-playbook playbook.yml

Using Docker in Jenkinsfile

##### Jenkins Docker Pipeline plugin

  stage('Run Tests') {
    try {
      dir('webapp') {
        sh "mvn test"
        docker.build("sbeliakou/my_container:${env.BUILD_NUMBER}").push()
      }
    } catch (error) {

    } finally {
      junit '**/target/surefire-reports/*.xml'
    }
  }
