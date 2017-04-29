# Task:
1. Create custom ansible (v2.2.1) image
2. Launch Jenkins from [official image](https://hub.docker.com/_/jenkins/)
3. Link Docker Host as Jenknis slave (ssh)
4. Create custom gradle image
5. Configure a job to build [spring-boot application](https://spring.io/guides/gs/spring-boot/) using gradle image buit in 3
6. Configure a job to run just built Spring Boot app with docker-compose



### Example of usage docker to isolate toolset with its dependencies:

```
# what version?
$ docker run --rm sbeliakou/ansible:2.2.1 ansible --version

# run playbook from current dir
$ alias ansible-playbook='docker run --rm -v $(pwd):$(pwd) -w $(pwd) sbeliakou/ansible:2.2.1 ansible-playbook -vv'
$ ansible-playbook playbook.yml
```

### Using Docker in Jenkinsfile
[Jenkins Docker Pipeline plugin](https://go.cloudbees.com/docs/cloudbees-documentation/cje-user-guide/index.html#docker-workflow)

```
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
```

# Report:
1. Built ansuble image using ansible.Dockerfile:
```
FROM sbeliakou/centos:7.2
RUN yum install -y epel-release yum-plugin-ovl python2-pip gcc libffi-devel python-devel openssl-devel && \
pip install ansible==2.2.1
```
2. Sample ansible run:

![](https://github.com/MNTLab/docker/blob/docker-2/siarhei_hreben/docker-2/docker-2_ansible.png)

3. Built gradle image using gradle.Dockerfile:
```
FROM sbeliakou/centos:7.2
RUN yum install -y yum-plugin-ovl && \
yum install -y which zip unzip java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
curl -s "https://get.sdkman.io" | bash && \
source "/root/.sdkman/bin/sdkman-init.sh" && \
sdk install gradle 3.5
ENV PATH /root/.sdkman/candidates/gradle/3.5/bin/:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.131-2.b11.el7_3.x86_64/
```

4. Sample gradle run:

![](https://github.com/MNTLab/docker/blob/docker-2/siarhei_hreben/docker-2/docker-2_gradle.png)

5. Launched Jenkins from official image using command:
```
sudo docker run -itd -p 8080:8080 -p 50000:50000 \
--env JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties" \
-v /home/student/docker/jenkins_home:/var/jenkins_home --name jenkins jenkins

```
Configured Jenkins.

![](https://github.com/MNTLab/docker/blob/docker-2/siarhei_hreben/docker-2/docker-2_jenkins.png)

6. Configured pipeline to build and run spring app.

Pipeline:
```
try {
node('host') {
    stage('\u27A1 Preparation (Checking out)') {
		env.Stage = 'Preparation (Checking out)'
		git changelog: false, poll: false, url: 'https://github.com/spring-guides/gs-spring-boot.git'
	}
	stage('\u27A1 Building code') {
		env.Stage = 'Building code'
		sh '''alias gradle='docker run --rm -v $(pwd):$(pwd) -w $(pwd) gradle gradle'
		cd initial
		gradle build'''
	}
	stage('\u27A1 Packaging and Publishing results') {
		env.Stage = 'Packaging and Publishing results'
		archiveArtifacts 'initial/build/libs/gs-spring-boot-0.1.0.jar'
    }
        stage('\u27A1 Running app') {
		env.Stage = 'Running app'
        git branch: 'docker-2/siarhei_hreben', changelog: false, poll: false, url: 'https://github.com/MNTLab/docker.git'
        sh '''
        cp initial/build/libs/gs-spring-boot-0.1.0.jar docker-2/
        cd docker-2
        docker-compose up -d
        '''
    }
}       // node end
} catch (hudson.AbortException exc) {
        env.Msg = """
		============================
		Build ABORTED on stage "$Stage"
		============================
		Trace: $exc
		"""
        echo "$Msg"

} catch (err) {
		currentBuild.result = 'FAILURE'
		env.Msg = """
		============================
		Build FAILED on stage "$Stage"
		============================
		Trace: $err
		"""
		echo "$Msg"
}
```
Job console output:
```
:processResources NO-SOURCE
:classes
:findMainClass
:jar
:bootRepackage
:assemble
:compileTestJava NO-SOURCE
:processTestResources NO-SOURCE
:testClasses UP-TO-DATE
:test NO-SOURCE
:check UP-TO-DATE
:build

BUILD SUCCESSFUL

Total time: 57.847 secs
...
Step 6/6 : CMD java -jar /tmp/gs-spring-boot-0.1.0.jar
 ---> Running in 1aa9c43de721
 ---> 25028c51b5d7
Removing intermediate container 1aa9c43de721
Successfully built 25028c51b5d7
Image for service app was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Creating docker2_app_1
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```
### The result

![](https://github.com/MNTLab/docker/blob/docker-2/siarhei_hreben/docker-2/docker-2_spring_page.png)


