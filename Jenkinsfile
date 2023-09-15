pipeline {
    agent any
    stages {
        stage('Dotnet Build') {
            steps {
                // Use the 'sh' step to run shell commands
             
                 sh 'dotnet build' 
                // Add your Dotnet build steps here
            }
        }
        
        stage('Docker Build') {
            steps {
                // Use the 'sh' step to run shell commands
                 sh 'docker build aoifemoconnor/mywebsite:latest .'
            }
        }
    }
}



