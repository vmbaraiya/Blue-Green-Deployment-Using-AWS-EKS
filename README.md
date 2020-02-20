[![CircleCI](https://circleci.com/gh/vmbaraiya/Operationalize-a-ML-Microservice-API.svg?style=svg)](https://circleci.com/gh/vmbaraiya/Operationalize-a-ML-Microservice-API)   

[![Pipeline Snapshot](https://github.com/vmbaraiya/Blue-Green-Deployment-Using-AWS-EKS/blob/master/Blue-Green_Deployment%20Pipeline.PNG)
<p align="center">
    <h1 align="center">Blue-Green-Deployment Using CI/CD with AWS EKS</h1>
</p>
<p align="center">
<b>Project Overview</a></b>
|
<b>Installation</b>
|
<b>Documentation</b>

### Project Overview
Develop a CI/CD pipeline for micro services applications with blue/green deployment. We will also develop Continuous Integration steps as you see fit, but must at least include typographical checking (aka “linting”).

### Project Tasks

project goal is to operationalize machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project we will:
* Pushing the built Docker container(s) to the Docker repository (use AWS ECR/ Dockerhub);
* Deploying these Docker container(s) to a small Kubernetes cluster. 
* Use Ansible or CloudFormation to build your “infrastructure”; i.e., the Kubernetes Cluster
* Kubernetes cluster use AWS Kubernetes as a Service.
* Construct your pipeline in your GitHub repository, <b>GitOps</b>



**The final implementation of the project will showcase your abilities to implement blue/green deployment using docker, kubernete, AWS EKS.**

---

### File Information
* Dockerfile 
    -  file that contains all commands, in order, needed to build a image.
* run_docker.sh
    -  Shell Script to run docker container and exposed container port to host.
* upload_docker.sh
    -  Shell Script to push image to docker registery with tag
* run_kubernetes.sh
    -  Shell Script to run kubernetes Pod with docker container and forward port from container to host
* Jenkinsfile
    -  Descriptive Jenkinsfile for automating the blue/green deployment pipeline 
---

## Installation

* Install java
* Install Jenkins
* Configure Jenkins with AWS Credential and docker Credential
* Install BlueOcean Plugin
* Install Docker
* Install AWS CLI (1.16 or higher)
```shell
	curl -O https://bootstrap.pypa.io/get-pip.py
  python get-pip.py
  Pip install awscli –upgrade
  ```
 * Install EKSCTL
 ```shell
  curl --silent –location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
  sudo mv /tmp/eksctl /usr/local/bin
  eksctl version
  [ℹ]  version.Info{BuiltAt:"", GitCommit:"", GitTag:"0.13.0"}
  ```
 * Install KUBECTL
 ```shell
  curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
  chmod +x ./kubectl
  sudo mv ./kubectl /usr/local/bin/kubectl
  kubectl version --short --client
    Client Version: v1.17.3
  ```
  * Install Hadolint for Linting test
```shell
sudo  wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
sudo chmod +x /bin/hadolint
```

### NOTES

- **eksctl is a simple CLI tool for creating clusters on EKS - Amazon’s new managed Kubernetes service.It is written in Go,  uses <b>CloudFormation</b>. customize cluster by using a config file**
```shell
eksctl create cluster -f cluster.yaml
```
  ***Important: In us-east-1 you are likely to get UnsupportedAvailabilityZoneException. 
     If you do, copy the suggested zones and pass --zones flag, e.g. eksctl create cluster --region=us-east-1 --zones=us-east-1a,us-east-1b,us-east-1d.***
  
  
### Kubernetes Steps
* Microservices deployed using pipeline in AWS EKS
* Label instances with blue and green application accordingly
* Redirect live Traffic to green environment by updating the updating LB service with selector
* 
* [Kubernetes command](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
```shell
kubectl get nodes
kubectl get pods
kubectl get svc
kubectl describe svc lbsvc_name
kubectl logs podname
```


### REFERENCE
 - [Dockerfile](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
 - [Blue/green Deployment](https://docs.cloudfoundry.org/devguide/deploy-apps/blue-green.html)
 - [Kubernetes](https://kubernetes.io/)
 - [Jenkinsfile](https://jenkins.io/doc/book/pipeline/jenkinsfile/)
 - [EKSCTL](https://eksctl.io/)
 - [AWS EKS](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)
 - [cloudformation](https://docs.aws.amazon.com/cloudformation/)
 - [Hadolint](https://hackage.haskell.org/package/hadolint)
 


 

