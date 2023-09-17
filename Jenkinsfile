pipeline {
    agent any

<<<<<<< HEAD
    environment {
        DOCKER_IMAGE = 'aoifemoconnor/dotnet-mywebsite'
        EB_APP_NAME = 'oewoirowerwoei'
        EB_ENV_NAME = 'Oewoirowerwoei-env'
    }

=======
>>>>>>> 48b7e0a6fcf57e5c7112f59b4af96c53d25bb38a
    stages {
        stage('Checkout and Build .NET Core App') {
            steps {
                checkout scm
                script {
                    // Set the desired .NET Core version if necessary
                
                    sh "dotnet build -c Release"
                }
            }
        }

        stage('Dockerize') {
            steps {
                script {
                    sh "docker build -t aoifemoconnor/mywebsite:latest ."
                }
            }
        }

        stage('Deploy to AWS EC2') {
            steps {
                script {
<<<<<<< HEAD
                    withAWS(credentials: '103157789009', region: 'eu-west-1') {
                        elasticBeanstalkCreateApplication(applicationName: oewoirowerwoei)
                        elasticBeanstalkCreateEnvironment(applicationName: oewoirowerwoei, environmentName: Oewoirowerwoei-env, environmentType: 'SingleInstance')
                        elasticBeanstalkUploadArtifact(applicationName: oewoirowerwoei, environmentName: Oewoirowerwoei-env, sourceBundle: [
                            zipFile: "./publish"
                        ])
                        elasticBeanstalkDeployVersion(applicationName: oewoirowerwoei, environmentName: Oewoirowerwoei-env)
=======
                    withAWS(credentials: 'your-aws-credentials-id', region: 'your-aws-region') {
                        def versionLabel = env.BUILD_NUMBER
                        elasticBeanstalkCreateApplication(applicationName: EB_APP_NAME)
                        elasticBeanstalkCreateEnvironment(applicationName: EB_APP_NAME, environmentName: EB_ENV_NAME, environmentType: 'SingleInstance')
                        elasticBeanstalkUploadArtifact(applicationName: EB_APP_NAME, environmentName: EB_ENV_NAME, sourceBundle: [
                            zipFile: "./publish"
                        ])
                        elasticBeanstalkDeployVersion(applicationName: EB_APP_NAME, environmentName: EB_ENV_NAME, versionLabel: versionLabel)
>>>>>>> 48b7e0a6fcf57e5c7112f59b4af96c53d25bb38a
                    }
                }
            }
        }
    }

    post {
        success {
            // Add post-build actions here if needed
        }
    }
}

    