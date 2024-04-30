pipeline {
    agent any

    stages {
        stage('Clone repository') {
                checkout scm
          }

        stage('Build') {
            def image = docker.build(${env.COMPONENT_NAME})
        }

//         stage('Run Pytests') {dfd
//             steps {
//                 script {
//                     docker.image(DOCKER_IMAGE).inside {
//                         sh 'pytest' // Run your pytest command here
//                     }
//                 }
//             }
//         }
//
//         stage('Push Image') {
//             when {
//                 expression {
//                     currentBuild.result == 'SUCCESS'
//                 }
//             }
//             steps {
//                 script {
//                     docker.withRegistry('https://your_registry/', 'credentials_id') {
//                         docker.image(DOCKER_IMAGE).push("${env.BUILD_NUMBER}")
//                         docker.image(DOCKER_IMAGE).push('latest')
//                     }
//                 }
//             }
//         }
    }
}