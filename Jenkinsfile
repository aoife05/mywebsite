pipeline {
    agent any
    stages {
        stage('Dotnet build') {
            steps {
                // Add your Dotnet build steps here
            }
        }
        
        stage('Docker Build') {
            agent any
            steps {
                script {
                    // Make sure to escape single quotes within the shell command
                    sh "docker build -t aoifemoconnor/mywebsite:latest ."
                }
            }
        }
    }
}
