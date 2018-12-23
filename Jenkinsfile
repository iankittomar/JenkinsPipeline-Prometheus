pipeline {
  environment {
    registry = 'iankittomar/prometheus'
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('cloning') {
      steps {
        git 'https://github.com/iankittomar/JenkinsPipeline-Prometheus.git'
      }
    }
    stage('mvn-Build') {
       steps {
         sh 'mvn clean'
         sh 'mvn package'
       }
    }
    stage('Docker-build') {
      steps {
		sh 'docker build -t ankit .'
      }
    }
	
	stage('Docker-Container') {
      steps {
         sh 'docker run -d -p 9090 --name ank ankit'
         sh 'docker ps'
      }
    }
	
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ':$BUILD_NUMBER'
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}
