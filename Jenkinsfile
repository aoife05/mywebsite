pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your GitHub repository
                git 'https://github.com/aoife05/mywebsite.git'
            }
        }
        
        stage('Dotnet Build') {
            steps {
                // Use the 'sh' step to run shell commands for .NET build
                sh 'dotnet build'
                // Add more .NET build steps as needed
            }
        }

        stage('Docker Build and Push') {
            steps {
                // Build the Docker image
                sh 'docker build -t aoifemoconnor/mywebsite:latest .'

                // Push the Docker image to a Docker registry (e.g., Docker Hub)
                sh 'docker push aoifemoconnor/mywebsite:latest'
            }
        }

        stage('Deploy to AWS EC2') {
            steps {
                // Use the 'sh' step to run shell commands for AWS deployment
                sh '''
                    # Install AWS CLI (if not already installed)
                    pip install awscli --upgrade --user

                    # Configure AWS CLI with your credentials
                    aws configure set aws_access_key_id YOUR_ACCESS_KEY_ID
                    aws configure set aws_secret_access_key YOUR_SECRET_ACCESS_KEY
                    aws configure set default.region YOUR_AWS_REGION

                    # Deploy your Docker container to an AWS EC2 instance using ECS or other methods
                    # Example: ecs-cli compose --file your-docker-compose-file.yml up
                '''
            }
        }
    }
}





