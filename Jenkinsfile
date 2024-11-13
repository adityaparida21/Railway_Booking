pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install --prefix frontend'
                sh 'npm install --prefix backend'
            }
        }

        stage('Build Frontend') {
            steps {
                sh 'npm run build --prefix frontend'
            }
        }

        stage('Run Tests') {
            steps {
                parallel (
                    'Frontend Tests': {
                        sh 'npm run test --prefix frontend'
                    },
                    'Backend Tests': {
                        sh 'npm run test --prefix backend'
                    }
                )
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo deploying'
            }
        }
    }

    post {
        success {
            echo 'Build, test, and deployment completed successfully.'
        }
        failure {
            echo 'Build, test, or deployment failed.'
        }
    }
}

