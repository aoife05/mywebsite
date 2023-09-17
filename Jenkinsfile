pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'aoifemoconnor/dotnet-mywebsite'
        EB_APP_NAME = 'oewoirowerwoei'
        EB_ENV_NAME = 'Oewoirowerwoei-env'
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
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Deploy to AWS Elastic Beanstalk') {
            steps {
                script {
                    withAWS(credentials: '103157789009', region: 'eu-west-1') {
                        elasticBeanstalkCreateApplication(applicationName: oewoirowerwoei)
                        elasticBeanstalkCreateEnvironment(applicationName: oewoirowerwoei, environmentName: Oewoirowerwoei-env, environmentType: 'SingleInstance')
                        elasticBeanstalkUploadArtifact(applicationName: oewoirowerwoei, environmentName: Oewoirowerwoei-env, sourceBundle: [
                            zipFile: "./publish"
                        ])
                        elasticBeanstalkDeployVersion(applicationName: oewoirowerwoei, environmentName: Oewoirowerwoei-env)
                    }
                }
            }
        }
    }
}
