node('host_machine') {
  stage('Checkout application') {
	  git ' https://github.com/spring-guides/gs-spring-boot.git'
  }
  stage('Build artefact with gradle')
  {
     sh '''cd initial
        alias gradle='docker run --rm -v $(pwd):$(pwd) -w $(pwd) gradle gradle'
        gradle build
        cp build/libs/gs-spring-boot-0.1.0.jar ../../../artefact/
        chmod +x ../../../artefact/gs-spring-boot-0.1.0.jar
	'''
  }
  stage('Deploy artefact on server')
  {
     sh ''' 
            docker-compose up -d
	'''
  }
}
