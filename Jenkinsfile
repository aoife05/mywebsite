pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'aoifemoconnor/dotnet-mywebsite'
        EB_APP_NAME = 'your-elastic-beanstalk-app-name'
        EB_ENV_NAME = 'your-elastic-beanstalk-env-name'
    }

    stages {
        stage('Build') {
            steps {
                checkout scm
                script {
                    sh 'dotnet restore'
                    sh 'dotnet publish -c Release -o ./publish'
                }
            }
        }

        stage('Dockerize') {
            steps {
                script {
                    sh 'docker build -t aoifemoconnor/mywebsite:latest .'
                }
            }
        }

        stage('Deploy to AWS Elastic Beanstalk') {
            steps {
                script {
                    withAWS(credentials: 'your-aws-credentials-id', region: 'your-aws-region') {
                        elasticBeanstalkCreateApplication(applicationName: EB_APP_NAME)
                        elasticBeanstalkCreateEnvironment(applicationName: EB_APP_NAME, environmentName: EB_ENV_NAME, environmentType: 'SingleInstance')
                        elasticBeanstalkUploadArtifact(applicationName: EB_APP_NAME, environmentName: EB_ENV_NAME, sourceBundle: [
                            zipFile: "./publish"
                        ])
                        elasticBeanstalkDeployVersion(applicationName: EB_APP_NAME, environmentName: EB_ENV_NAME)
                    }
                }
            }
        }
    }
}





