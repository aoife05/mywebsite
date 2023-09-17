pipeline {
    agent any

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
                    withAWS(credentials: 'your-aws-credentials-id', region: 'your-aws-region') {
                        def versionLabel = env.BUILD_NUMBER
                        elasticBeanstalkCreateApplication(applicationName: EB_APP_NAME)
                        elasticBeanstalkCreateEnvironment(applicationName: EB_APP_NAME, environmentName: EB_ENV_NAME, environmentType: 'SingleInstance')
                        elasticBeanstalkUploadArtifact(applicationName: EB_APP_NAME, environmentName: EB_ENV_NAME, sourceBundle: [
                            zipFile: "./publish"
                        ])
                        elasticBeanstalkDeployVersion(applicationName: EB_APP_NAME, environmentName: EB_ENV_NAME, versionLabel: versionLabel)
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

    