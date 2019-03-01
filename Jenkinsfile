pipeline{
    agent {
        docker {
            image 'docker:stable-git'
        }
    }
    environment {
        IMAGE_NAME = 'btodhunter/anchore-demo'
        IMAGE_TAG = 'jenkins'
    }
    stages {
        stage('Build Image') {
            steps {
                script {
                    def customImage = docker.build("${env.IMAGE_NAME}:${env.IMAGE_TAG}")
                }
            }
        }
        stage('Scan') {
            steps {        
                sh 'apk add bash curl'
                sh 'curl -s https://raw.githubusercontent.com/anchore/ci-tools/master/scripts/inline_scan | bash -s -- ${IMAGE_NAME}:${IMAGE_TAG}'
            }
        }
        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub-creds'){
                        customImage.push()
                    }
                }
            }
        }
    }
}