pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'echo Building application...'
                sh 'npm install'  // Install dependencies
            }
        }

        stage('Test') {
            steps {
                sh 'echo Running tests...'
                sh 'npm run test'  // Run tests
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo Deploying application...'
                // Add deployment command here (e.g., SSH to server and deploy)
            }
        }
    }
}

