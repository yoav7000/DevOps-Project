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
            image = docker.build(${env.COMPONENT_NAME})
            }
        }
    }
}