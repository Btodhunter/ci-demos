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
                //sh 'docker build -t ${IMAGE_NAME}:ci .'
                script {
                    def customImage = docker.build("${env.IMAGE_NAME}:${env.IMAGE_TAG}")
                }
            }
        }
        stage('Scan') {
            steps {        
                sh 'apk add bash curl'
                sh 'curl -s https://raw.githubusercontent.com/anchore/ci-tools/master/scripts/inline_scan | bash -s -- -f ${IMAGE_NAME}:${IMAGE_TAG}'
            }
        }
        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-creds')
                        customImage.push()
                }
                //sh 'docker tag ${IMAGE_NAME}:ci ${IMAGE_NAME}:${IMAGE_TAG}'
                //sh 'docker push ${IMAGE_NAME}:${IMAGE_TAG}'
            }
        }
    }
}