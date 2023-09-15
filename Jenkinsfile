pipeline {
    agent any
    stages {
        stage('Dotnet Build') {
            steps {
                // Use the 'sh' step to run shell commands
                sh 'dotnet clean'
                sh 'dotnet build'
                // Add your Dotnet build steps here
            }
        }
        
        stage('Docker Build') {
            steps {
                // Use the 'sh' step to run shell commands
                sh 'docker build -t aoifemoconnor/mywebsite:latest .'
            }
        }
    }
}


