pipeline {
    agent any

    stages {
        stage('Frontend Build') {
            steps {
                dir('frontend') {
                    sh 'echo "Building frontend"'
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }

        stage('Backend Build') {
            steps {
                dir('backend') {
                    sh 'echo "Building backend"'
                    sh 'npm install'
                }
            }
        }

        stage('Test') {
            steps {
                dir('frontend') {
                    sh 'echo "Testing frontend"'
                    sh 'npm run test'
                }
                dir('backend') {
                    sh 'echo "Testing backend"'
                    sh 'npm run test'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo deploying'
            }
        }
    }
}

