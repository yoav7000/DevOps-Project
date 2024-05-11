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
                    dockerImage = docker.build("${env.IMAGE_REPOSITORY}" + ":${GIT_COMMIT}")
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    dockerImage.inside{
                    sh "pytest ."
                    }
                }
            }
        }
        stage('Scan') {
            agent {
                docker { image 'aquasec/trivy' }
            }
            steps {
                script {
                    sh 'trivy ${dockerImage.name}'
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-creds') {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}