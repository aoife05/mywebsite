pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'aoifemoconnor/mywebsite'
        AWS_REGION = 'your-aws-region'
        AWS_ACCESS_KEY_ID = credentials('your-aws-access-key-id-credential-id')
        AWS_SECRET_ACCESS_KEY = credentials('your-aws-secret-access-key-credential-id')
        AWS_ECR_REPO_URL = 'your-ecr-repo-url'
        GITHUB_REPO_URL = 'https://github.com/aoife05/mywebsite.git'
        DOTNET_CLI_VERSION = '7.0.10' // or '5.0' or your desired .NET Core version
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build .NET Core App') {
            steps {
                script {
                    sh "dotnet restore"
                    sh "dotnet build -c Release"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build("aoifemoconnor/mywebsite:latest", "--build-arg DOTNET_VERSION=7.0.10 .")
                }
            }
        }

        stage('Push Docker Image to ECR') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'your-aws-ecr-credentials', variable: 'AWS_CREDENTIALS')]) {
                        sh """
                            export AWS_ACCESS_KEY_ID=\$AWS_CREDENTIALS_AWS_ACCESS_KEY_ID
                            export AWS_SECRET_ACCESS_KEY=\$AWS_CREDENTIALS_AWS_SECRET_ACCESS_KEY
                            export AWS_DEFAULT_REGION=\$AWS_CREDENTIALS_AWS_DEFAULT_REGION

                            aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ECR_REPO_URL
                            docker push $AWS_ECR_REPO_URL:$BUILD_NUMBER
                        """
                    }
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                // Add your deployment steps here, e.g., SSH into EC2 instance and run docker container
                // You may need to use SSH Agent and SSH keys for secure access to the EC2 instance
            }
        }
    }
}





