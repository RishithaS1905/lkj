pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t rishithas/lkj:latest .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                // Ensure 'docker-hub-creds' matches your actual Credential ID in Jenkins
                withCredentials([string(credentialsId: 'docker-hub-creds', variable: 'DOCKER_PASS')]) {
                    bat "echo %DOCKER_PASS% | docker login -u rishithas --password-stdin"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push rishithas/lkj:latest'
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline finished.'
        }
        failure {
            echo 'Pipeline failed. Check the logs above.'
        }
    }
}
