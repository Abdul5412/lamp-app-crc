pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo 'GitHub se code checkout ho raha hai...'
            }
        }

        stage('Build Container Image') {
            steps {
                echo 'Podman se image build ho rahi hai...'
                sh 'podman build --network=host -t lamp-app-jenkins:latest .'
            }
        }

        stage('Deploy to CRC') {
            steps {
                echo 'CRC par deploy ho raha hai...'
                sh '''
                    podman stop lamp-jenkins-container || true
                    podman rm lamp-jenkins-container || true
                    podman run -d --replace --network=host --name lamp-jenkins-container --restart=always lamp-app-jenkins:latest
                    sleep 3
                    podman ps | grep lamp-jenkins-container
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                echo 'Deployment verify ho rahi hai...'
                sh 'podman ps | grep lamp-jenkins-container'
            }
        }
    }

    post {
        success {
            echo 'LAMP App successfully deployed!'
        }
        failure {
            echo 'Deployment fail ho gayi, logs check karo.'
        }
    }
}
