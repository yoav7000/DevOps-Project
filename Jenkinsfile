pipeline {
    environment {
        image_name = "${env.REPO_USER}/${env.COMPONENT_NAME}"
    }
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
                    dockerImage = docker.build(image_name + ":${GIT_COMMIT}")
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