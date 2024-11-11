pipeline {
    agent any
    
    environment {
        NODE_HOME = '/usr/local/bin/node'
        PATH = "$NODE_HOME/bin:$PATH"
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        
        stage('Install Frontend Dependencies') {
            steps {
                dir('frontend') {
                    sh 'npm install'
                }
            }
        }
        
        stage('Build Frontend') {
            steps {
                dir('frontend') {
                    sh 'npm run build'
                }
            }
        }
        
        stage('Install Backend Dependencies') {
            steps {
                dir('backend') {
                    sh 'npm install'
                }
            }
        }
        
        stage('Run Tests') {
            steps {
                parallel(
                    "Frontend Tests": {
                        dir('frontend') {
                            sh 'npm run test'
                        }
                    },
                    "Backend Tests": {
                        dir('backend') {
                            sh 'npm run test'
                        }
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

