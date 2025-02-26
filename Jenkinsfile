pipeline {
  agent { label 'docker' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKER_IMAGE_NAME = 'naveenyash/ny-alpine:latest'
    DOCKERHUB_CREDENTIALS = credentials('naveenyash-dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t $DOCKER_IMAGE_NAME .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push $DOCKER_IMAGE_NAME'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
