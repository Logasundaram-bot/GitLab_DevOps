# From Terrafrom to Automation: Automating Azure Infrastructure with CI/CD Pipelines

## Overview

This project automates the provisioning and management of Azure infrastructure using Terraform, ansible and GitLab CI/CD. Infrastructure is defined as code and deployed through an automated pipeline, ensuring consistency, repeatability, and version-controlled changes.

## Features

* Infrastructure as Code (Terraform)
* Automated CI/CD using GitLab Pipelines
* Azure Resource Group Provisioning
* Virtual Network & Subnet Creation
* Azure Kubernetes Service (AKS)
* Azure Container Registry (ACR)
* Azure Application Gateway (AGIC)
* Azure DNS Configuration
* ArgoCD Server Deployment
* Remote Terraform State Management
* Environment-Based Deployments
* Secure Credential Management using GitLab Protected & Masked Variables
* No Hardcoded Secrets in Source Code

## Architecture

```text
DevOps Engineer
   │
   ▼
GitHub Repository
   │
   ▼
GitLab CI/CD Pipeline
   ├── terraform fmt
   ├── terraform validate
   ├── terraform plan
   └── terraform apply
   └── ansible playbook
   │
   ▼
Azure Infrastructure
   ├── Resource Group
   ├── VNet & Subnets
   ├── AKS Cluster
   ├── ACR
   ├── AGIC
   ├── Application Gateway
   └── Azure DNS
   │
   ▼
AKS cluster bootstrap
   ├── ArgoCD Server
   └── Parent Application (Root App)
   
```
## Prerequisites

* Terraform
* Azure Subscription
* GitLab Runner
* Azure Service Principal
* GitLab CI/CD Variables
  
## CI/CD Pipeline Stages

| Stage              | Description                               |
| ------------------ | ------------------------------------------|
| terraform_validate | Validates Terraform configuration         |
| terraform_plan     | Generates execution plan                  | 
| terraform_apply    | Deploys infrastructure to Azure           |
| ansible playbook   | AKS Cluster bootstrap and installation  of ArgoCD add-on are automated using Ansible    | 
| terraform_destroy  | Optional infrastructure cleanup           |

<img width="1366" height="565" alt="image" src="https://github.com/user-attachments/assets/d5210fad-68e0-41c4-a150-24d45c8a67bc" />

## Security

* Azure credentials stored as GitLab Protected Variables
* Remote state stored securely in Azure Storage Account
* No hardcoded secrets in source code
* RBAC-based access control
  
## Azure Authentication in Pipeline

* To allow GitLab CI/CD to provision and manage Azure resources, a Service Principal is created in Azure and its credentials are stored securely as GitLab Protected and Masked Variables.
<img width="803" height="456" alt="image" src="https://github.com/user-attachments/assets/f07f0ce3-870f-470c-b7fe-62a797248c92" />


## Benefits

* Automated Infrastructure Provisioning
* Consistent Environment Management
* Reduced Manual Errors
* Faster Deployment Cycles
* Infrastructure Version Control

## Technologies Used

* Terraform
* Microsoft Azure
* GitLab CI/CD
* Azure Kubernetes Service (AKS)
* Azure Container Registry (ACR)
* Application Gateway Ingress Controller(AGIC)
* Azure DNS
* Application Gateway
* ArgoCD

## Author

**Logasundaram S**

DevOps Engineer | Azure | Terraform | Kubernetes | GitLab CI/CD
