#!groovy
node('node-host') {

//All stages step-by-step
  stage '\u2780 Preparation (Checking out)'
	    git ' https://github.com/spring-guides/gs-spring-boot.git'
 
  stage '\u2781 Building app with gradle'
        sh '''alias gradle='docker run --rm -v $(pwd):$(pwd) -w $(pwd) ngkuznetsov/gradle:3.2.1 gradle'
        cd initial/
        gradle build
        sudo mv build/libs/gs-spring-boot-0.1.0.jar /home/student/docker2/resources/gs-spring-boot.jar'''

  stage '\u2782 Triggering job for deploying Spring'
	build job: "Spring_Run"
}

