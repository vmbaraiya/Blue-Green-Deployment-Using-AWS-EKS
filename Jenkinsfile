pipeline {
    environment {
        registry = "vmbaraiya/capstonebluegreenappimage"
        registryCredential = 'dockerhub'
    }
    agent any
    stages {
        stage('Environment Test') {
            steps{
                sh 'echo "eksctl version $(eksctl version)"'
                sh 'echo "docker version $(docker --version)"'
                sh 'echo "kubectl version $(kubectl version --short --client)"'
                sh 'echo "Hadolint version $(hadolint --version)"'
            }
        }
	stage('Lint Test'){
            parallel{
                stage('Blue App Lint test'){
                    steps{
                        sh ' echo "test blue app dockerfile"'
                        sh 'hadolint blue_app/Dockerfile'
                    }
                }
                stage('Green App Lint test'){
                    steps{
                        sh ' echo "test green app dockerfile"'
                        sh 'hadolint green_app/Dockerfile'
                    }
                }
            }
        }

    }
}

