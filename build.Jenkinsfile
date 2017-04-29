node('Docker Host') {
  stage ('Building Docker image'){
       git 'https://github.com/sunofsparda/docker.git'
       def gradle = docker.build 'gradle'
  }
  stage('Preparation (Checking out)') {
	git ' https://github.com/spring-guides/gs-spring-boot.git'
  }
  stage('Build application'){
        sh '''touch /opt/test/123.txt
        cd initial
        alias gradle='docker run --rm -v $(pwd):$(pwd) -w $(pwd) gradle gradle'
        gradle build
        cp build/libs/gs-spring-boot-0.1.0.jar /opt/test/
        chmod +x ${WORKSPACE}/gs-spring-boot-0.1.0.jar'''
  }
}
