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

        stage('build image'){
            parallel{
                stage('Build Blue App Image'){
                    steps{
                        sh 'echo " building blue app docker image"'
                        sh 'blue_app/run_docker.sh'
                    }
                }
                stage('Build Green App Image'){
                    steps{
                        sh 'echo "building green app image"'
                        sh 'green_app/run_docker.sh'
                    }
                }
            }  
        }

        stage('Push image to DockerHub'){
            parallel{
                stage('Push Blue App Image'){
                    steps{
                        sh 'echo " push blueapp image to dockerhub"'
                        sh 'blue_app/upload_docker.sh'
                    }
                }
                stage('Push Green App Image'){
                    steps{
                        sh 'echo " push green app image to dockerhub"'
                        sh 'green_app/upload_docker.sh'
                    }
                }
            }  
        }

        stage('Deploy Image to AWS Eks cluster'){
            parallel{
                stage('Deploy Blue App Image'){
                    steps{
                        sh 'echo "deploy blueapp image"'
                        sh 'blue_app/run_kubernetes.sh'
                    }
                }
                stage('Deploy Green App Image'){
                    steps{
                        sh 'echo "deploy greenapp image"'
                        sh 'green_app/run_kubernetes.sh'
                    }
                }
            }  

        stage('kubect svc load balancer'){
            steps{
                sh 'echo "run load balancer service"'
                sh './run_kubernetes.sh'
            }
        }
        stage("Cleaning up") {
            sh 'echo "Cleaning up..."'
            sh 'docker system prune'
        }
    }
}

