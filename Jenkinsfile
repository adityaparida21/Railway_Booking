pipeline {
    agent any

    stages {
        stage('Frontend Build') {
            steps {
                dir('frontend') {
                    script {
                        // Debugging step: check contents of frontend directory
                        sh 'echo "Listing files in frontend directory"'
                        sh 'ls -la'

                        sh 'echo "Building frontend"'
                        sh 'npm install'
                        
                        // Ensure .env.example exists in frontend before copying
                        sh 'if [ -f .env.example ]; then cp .env.example .env; else echo ".env.example not found"; exit 1; fi'

                        sh 'npm run build'
                    }
                }
            }
        }

        stage('Backend Build') {
            steps {
                dir('backend') {
                    script {
                        // Debugging step: check contents of backend directory
                        sh 'echo "Listing files in backend directory"'
                        sh 'ls -la'

                        sh 'echo "Building backend"'
                        sh 'npm install'
                        
                        // Ensure .env.example exists in backend before copying
                        sh 'if [ -f .env.example ]; then cp .env.example .env; else echo ".env.example not found"; exit 1; fi'
                    }
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
                // Add your deployment steps here (e.g., deploying to a server)
            }
        }
    }
}

