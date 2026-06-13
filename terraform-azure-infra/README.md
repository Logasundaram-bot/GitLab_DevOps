# From Terrafrom to Automation: Automating Azure Infrastructure with CI/CD Pipelines

## Overview

This project automates the provisioning and management of Azure infrastructure using Terraform and GitLab CI/CD. Infrastructure is defined as code and deployed through an automated pipeline, ensuring consistency, repeatability, and version-controlled changes.

## Features

* Infrastructure as Code (Terraform)
* Automated CI/CD using GitLab Pipelines
* Azure Resource Group Provisioning
* Virtual Network & Subnet Creation
* Azure Kubernetes Service (AKS)
* Azure Container Registry (ACR)
* Azure Application Gateway (AGIC)
* Azure DNS Configuration
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
   │
   ▼
Azure Infrastructure
   ├── Resource Group
   ├── VNet & Subnets
   ├── AKS Cluster
   ├── ACR
   ├── Application Gateway
   └── Azure DNS
```

## CI/CD Pipeline Stages

| Stage              | Description                       |
| ------------------ | --------------------------------- |
| terraform_validate | Validates Terraform configuration |
| terraform_plan     | Generates execution plan          |
| terraform_apply    | Deploys infrastructure to Azure   |
| terraform_destroy  | Optional infrastructure cleanup   |

## Prerequisites

* Terraform
* Azure Subscription
* GitLab Runner
* Azure Service Principal
* GitLab CI/CD Variables

## Security

* Azure credentials stored as GitLab Protected Variables
* Remote state stored securely in Azure Storage Account
* No hardcoded secrets in source code
* RBAC-based access control

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
* Azure DNS
* Application Gateway

## Author

**Logasundaram S**

DevOps Engineer | Azure | Terraform | Kubernetes | GitLab CI/CD
