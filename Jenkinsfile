pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "4vv23is260/myapp-image"
    }

    stages {

      stage('Clone Repository') {
    steps {
        git branch: 'main', url: 'https://github.com/RishithaS1905/lkj.git'
    }
}

       stage('Build Docker Image') {
    steps {
        // Use bat for Windows or sh for Linux
        bat 'docker build -t rishithas/lkj:latest .'
    }
}

        stage('Login to Docker Hub') {
    steps {
        withCredentials([
            string(credentialsId: 'Docker Hub Access Token', variable: 'DOCKER_PASS')
        ]) {
            // In Windows Batch, we use % to wrap variables
            bat "echo %DOCKER_PASS% | docker login -u rishithas --password-stdin"
        }
    }
}

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub-creds') {
                        docker.image("${DOCKER_IMAGE}:latest").push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Image successfully built and pushed to Docker Hub'
        }
        failure {
            echo 'Pipeline failed'
        }
    }
}
