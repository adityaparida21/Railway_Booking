pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'echo Building frontend...'
                dir('frontend') {
                    sh 'npm install'  // Install frontend dependencies
                    sh 'npm run build'  // Build frontend
                }
            }
        }

        stage('Test') {
            steps {
                sh 'echo Testing frontend...'
                dir('frontend') {
                    sh 'npm run test'  // Run frontend tests
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo Deploying frontend...'
                // Add deployment commands for frontend here
                // Example: 
                // sh 'deploy-frontend-command'
            }
        }
    }
}

