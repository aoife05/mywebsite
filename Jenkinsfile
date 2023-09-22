pipeline {
    agent any

    environment {
        DOCKER_IMAGE = '10616413/dotnet-mywebsite'
        EB_APP_NAME = 'oewoirowerwoei'
        EB_ENV_NAME = 'Oewoirowerwoei-env'
    }

    stages {
        stage('Checkout and Build .NET Core App') {
            steps {
                checkout scm
                script {
                    // Set the desired .NET Core version if necessary
                    dotnetBuild configuration: 'Release', sdk: 'dotnetsdk'
                    dotnetRestore 'mywebsite.csproj'
                    dotnetRun
                }
            }
        }

        stage('Dockerize') {
            steps {
                script {
                    sh "docker build -t 10616413/mywebsite:latest ."
                }
            }
        }

        stage('Deploy to AWS EC2') {
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

    