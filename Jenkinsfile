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
    }
}

