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
                try {
                    sh 'apk add bash'
                    def ret = sh script: 'curl -s https://raw.githubusercontent.com/anchore/ci-tools/scripts/inline_scan | bash -s -- -f ${IMAGE_NAME}:ci', returnStatus:true
                    if (ret != 0) {
                        echo "Return code from inline_scan: ${ret}. Failing the build"
                        currentBuild.result = 'FAILURE'
                        return
                    }
                }
                catch (exc) {
                    echo 'Something failed'
                    throw exc
                }
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