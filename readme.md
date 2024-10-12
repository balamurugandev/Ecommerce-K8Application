# Kubernetes Application on AWS with Jenkins, Terraform, and Docker

This project sets up a Kubernetes application on AWS using Jenkins, Terraform, and Docker. It consists of frontend, backend, and MongoDB services, containerized with Docker, deployed on AWS EKS, and managed with Jenkins pipelines.

## Table of Contents

- [Project Overview](#project-overview)
- [Prerequisites](#prerequisites)
- [Folder Structure](#folder-structure)
- [Terraform Setup](#terraform-setup)
- [Docker Setup](#docker-setup)
- [Kubernetes Deployment](#kubernetes-deployment)
- [Jenkins Setup](#jenkins-setup)
- [Pipeline Execution](#pipeline-execution)
- [Clean Up](#clean-up)

## Project Overview

This project automates the deployment of a microservices-based application, which consists of three main components:

1. **Frontend**: React.js application.
2. **Backend**: Node.js-based API server.
3. **Database**: MongoDB for data storage.

The infrastructure is provisioned using **Terraform** on **AWS**. The services are containerized using **Docker** and deployed to **AWS EKS** (Elastic Kubernetes Service) using **Kubernetes manifests**. **Jenkins** automates the build, test, and deployment process through a CI/CD pipeline.

## Prerequisites

Before starting, make sure you have the following tools installed:

- [AWS CLI](https://aws.amazon.com/cli/)
- [Terraform](https://www.terraform.io/downloads.html)
- [Docker](https://www.docker.com/get-started)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Jenkins](https://www.jenkins.io/download/)
- AWS Account with permissions to create EKS, EC2, and S3 resources.
- Jenkins plugins:
  - **Docker Pipeline**
  - **Amazon Web Services Credentials Plugin**
  - **Kubernetes CLI**
  - **Terraform Plugin**

## Folder Structure

```bash
.
├── terraform                # Terraform files for AWS infrastructure
│   ├── main.tf              # Main Terraform configuration
│   ├── variables.tf         # Variable declarations
│   └── outputs.tf           # Output configurations
├── frontend                 # Frontend React.js Docker app
│   ├── Dockerfile           # Dockerfile for frontend
│   └── src/                 # React.js source code
├── backend                  # Backend Node.js Docker app
│   ├── Dockerfile           # Dockerfile for backend
│   └── src/                 # Node.js API source code
├── mongo                    # MongoDB Docker setup
│   └── Dockerfile           # Dockerfile for MongoDB
├── k8s                      # Kubernetes deployment files
│   ├── frontend-deployment.yml  # Kubernetes deployment for frontend
│   ├── backend-deployment.yml   # Kubernetes deployment for backend
│   ├── mongo-deployment.yml     # Kubernetes deployment for MongoDB
│   └── services.yml             # Kubernetes service files for all components
└── Jenkinsfile              # Jenkins pipeline configuration

```

## Navigate to the terraform/ directory.

```bash
cd terraform/
```

Initialize Terraform to download the required provider plugins.

```bash
terraform init
```

Review the infrastructure changes with:

```bash
terraform plan
```

Apply the infrastructure changes:


```bash
terraform apply
```

Terraform will provision the AWS infrastructure, including VPC, subnets, security groups, and an EKS cluster.

Retrieve the kubeconfig file for your EKS cluster:

```bash
aws eks --region <your-region> update-kubeconfig --name <your-cluster-name>
```

Docker Setup

Navigate to each of the service directories (frontend, backend, mongo) and build the Docker images.


```bash
docker build -t <your-docker-registry>/<image-name> .
```

For example, to build the frontend image:

```bash
cd frontend/
docker build -t your-docker-registry/frontend-image .
```

Push the Docker images to your Docker registry (Docker Hub or AWS ECR).

```bash
docker push <your-docker-registry>/<image-name>
```

Kubernetes Deployment

Ensure your kubectl is configured with your AWS EKS cluster credentials:

```bash
aws eks --region <your-region> update-kubeconfig --name <your-cluster-name>
```

Navigate to the k8s/ directory:

```bash
cd k8s/
```

Deploy the services and deployments using the following command:

```bash
kubectl apply -f .
```
Verify the pods and services are running:

```bash
kubectl get pods
kubectl get svc
```
