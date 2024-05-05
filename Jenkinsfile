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
          steps{
            script {
              docker.withRegistry('', 'dockerhub-creds') {
                dockerImage.push()
              }
            }
      }
    }}
}