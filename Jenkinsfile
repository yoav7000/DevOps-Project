pipeline {

    agent any

    stages {
        stage('Clone repository') {
        steps {
            checkout scm
          }
        }
        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build("${env.COMPONENT_NAME}:${GIT_COMMIT}")
             }
            }
        }
        stage('Push Image') {
          environment {
                DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
            }
          steps{
            script {
              echo DOCKERHUB_CREDENTIALS
              docker.withRegistry('https://hub.docker.com//repository/docker/${env.IMAGE_REPO}') {
                dockerImage.push()
              }
            }
      }
    }}
}