pipeline {
    agent any
    
    environment {
        // Adjust the following as needed for your specific configuration
        NODE_HOME = '/usr/local/bin/node'
        PATH = "$NODE_HOME/bin:$PATH"
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    // Pull code from the repository
                    checkout scm
                }
            }
        }
        
        stage('Install Frontend Dependencies') {
            steps {
                dir('frontend') {
                    script {
                        // Install dependencies for the frontend
                        sh 'npm install'
                    }
                }
            }
        }
        
        stage('Build Frontend') {
            steps {
                dir('frontend') {
                    script {
                        // Build frontend for production
                        sh 'npm run build'
                    }
                }
            }
        }
        
        stage('Install Backend Dependencies') {
            steps {
                dir('backend') {
                    script {
                        // Install dependencies for the backend
                        sh 'npm install'
                    }
                }
            }
        }
        
        stage('Run Tests') {
            steps {
                parallel (
                    'Frontend Tests': {
                        dir('frontend') {
                            script {
                                // Run tests for the frontend
                                sh 'npm run test'
                            }
                        }
                    },
                    'Backend Tests': {
                        dir('backend') {
                            script {
                                // Run tests for the backend
                                sh 'npm run test'
                            }
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

