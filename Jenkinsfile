node('Host machine') {
  stage ('Building docker image'){
       git 'https://github.com/mordaBy/docker-gradle.git'
       docker.build("gradle")
  }
  
  stage('Getting app') {
	git 'https://github.com/spring-guides/gs-spring-boot.git'
  }
  
  stage('Build application'){
        sh '''
            cd initial
            docker run -v $(pwd):$(pwd) -w $(pwd) gradle build
        '''
        archiveArtifacts 'initial/build/libs/gs-spring-boot-0.1.0.jar'
  }
}