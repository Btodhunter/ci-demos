
node {
    stage('Clone repository') {
        checkout scm
    }
    stage('Build Image') {
        sh 'docker build -t btodhunter/anchore-demo:ci .'
    }
    stage('Scan') {
        try {
            sh 'apk add bash'
            def ret = sh script: 'curl -s https://raw.githubusercontent.com/anchore/ci-tools/scripts/inline_scan | bash -s -- -f btodhunter/anchore-demo:ci', returnStatus:true
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
        stage('Push Image') {
            sh 'docker tag btodhunter/anchore-demo:ci btodhunter/anchore-demo:jenkins'
            sh 'docker push btodhunter/anchore-demo:jenkins'
        }
    }
}