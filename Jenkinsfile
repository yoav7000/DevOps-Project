pipeline {
    agent any
    environment {
        TRIVY_IMAGE = 'aquasec/trivy'
    }
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
            steps {
                script {
                    sh "docker run --rm -v /var/run/docker.sock:/var/run/docker.sock ${env.TRIVY_IMAGE} --exit-code 1 image ${dockerImage.id} --severity HIGH,CRITICAL"
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