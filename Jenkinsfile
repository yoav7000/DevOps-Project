pipeline {
    agent any

    stages {
        stage('Clone repository') {
        steps {
            checkout scm
          }
        }
        stage('Build') {
            script {
            docker.build("${env.COMPONENT_NAME}")
            }
        }
    }
}