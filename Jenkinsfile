pipeline{
    agent any
    environment {
        IMAGE_NAME = 'btodhunter/anchore-demo'
        IMAGE_TAG = 'jenkins'
    }
    stages {
        stage('Clone repository') {
            steps {
                checkout scm
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:ci .'
            }
        }
        stage('Scan') {
            steps {        
                sh 'apk add bash'
                sh 'curl -s https://raw.githubusercontent.com/anchore/ci-tools/master/scripts/inline_scan | bash -s -- -f ${IMAGE_NAME}:ci'
            }
        }
        stage('Push Image') {
            steps {
                sh 'docker tag ${IMAGE_NAME}:ci $I{MAGE_NAME}:${IMAGE_TAG}'
                sh 'docker push ${IMAGE_NAME}:${IMAGE_TAG}'
            }
        }
    }
}