
# End-to-End GitOps Platform on Azure using Terraform, Ansible, GitLab CI/CD, and Argo CD

## Overview

This repository demonstrates a complete DevOps and GitOps implementation on Microsoft Azure, covering infrastructure provisioning, Kubernetes platform bootstrap, application delivery, and automated deployments.

The solution follows modern cloud-native practices by combining **Terraform**, **Ansible**, **GitLab CI/CD**, **Azure Kubernetes Service (AKS)**, **Azure Container Registry (ACR)**, and **Argo CD** to create a fully automated deployment platform.

The project is divided into three major layers:

### 1. Infrastructure Provisioning

Terraform provisions the Azure infrastructure required to host the platform, including:

* Resource Groups
* Virtual Networks and Subnets
* Azure Kubernetes Service (AKS)
* Azure Container Registry (ACR)
* Application Gateway (AGIC)
* Azure DNS
* Managed Identities and RBAC

Infrastructure deployment is fully automated through GitLab CI/CD pipelines.

### 2. Kubernetes Platform Bootstrap

After infrastructure creation, Ansible automates cluster configuration and platform setup by:

* Connecting to AKS
* Installing Argo CD
* Creating namespaces
* Configuring cluster prerequisites
* Deploying the Argo CD Parent Application

This enables GitOps-based cluster management.

### 3. GitOps Application Delivery

Argo CD follows the **App of Apps (Parent-Child Application)** pattern.

* Parent Application manages all child applications
* Child Applications deploy workloads and platform services
* Git becomes the single source of truth
* Automatic synchronization ensures desired state reconciliation

Application deployment is performed through GitLab CI/CD pipelines that:

* Build Docker images
* Run security scans
* Push images to Azure Container Registry
* Update GitOps manifests
* Trigger automated deployment through Argo CD

---

## Overall Architecture

```text
                    +---------------------+
                    |     DevOps Engineer |
                    +---------------------+
                              |
                              v
                    +--------------------+
                    |  GitHub Repository |
                    +--------------------+
                              |
                              v
                    +--------------------+
                    |   GitLab CI/CD     |
                    +--------------------+
                              |
        ------------------------------------------------
        |                                              |
        v                                              v

 +---------------------+                  +---------------------+
 |      Terraform      |                  |       Ansible       |
 | Infrastructure IaC  |                  | Cluster Bootstrap   |
 +---------------------+                  +---------------------+
        |                                              |
        v                                              |
 +-------------------------------------------------------------+
 |                    Microsoft Azure                          |
 +-------------------------------------------------------------+
 | Resource Group | VNet | AKS | ACR | AGIC | DNS | Gateway    |
 +-------------------------------------------------------------+
                              |
                              v
                     +----------------+
                     |    Argo CD     |
                     +----------------+
                              |
                              v
                   Parent Application (Root App)
                              |
                              v
                       Child Applications 
         ------------------------------------------------
         |                     |                       |
         v                     v                       v
    Frontend  App         Backend App            Platform Services
         |                     |                       |
         ------------------------------------------------
                              |
                              v
      +--------------------------------------------------------+
      |               Kubernetes Resourcese                    |
      +--------------------------------------------------------+
      |      Deployment|Service|Secret|ConfigMap|Ingress       |
      +--------------------------------------------------------+
                              |
                              v
                       Running Workloads
```

---

## Application Delivey Flow

```text
Developer Commit
       |
       v
GitLab CI/CD
       |
       +--> Build Application
       |
       +--> Run Tests
       |
       +--> Security Scan
       |
       +--> Build Docker Image 
       |
       +--> Push Image to ACR
       |
       +--> Update GitOps Repository
       |
       v
Argo CD Detects Change
       |
       v
Synchronize AKS Cluster
       |
       v
Deploy New Application Version
```

---

## Key Features

* Infrastructure as Code using Terraform
* Automated AKS Bootstrap using Ansible
* GitOps Deployment using Argo CD
* App of Apps Architecture
* GitLab CI/CD Automation
* Docker Image Build & Registry Integration
* Azure Container Registry (ACR)
* Security Scanning with Trivy and npm audit
* Automated Kubernetes Deployments
* Self-Healing and Drift Detection
* Secure Credential Management using GitLab Protected Variables
* Declarative Infrastructure and Application Management

---

## Benefits

* Fully Automated Platform Provisioning
* Faster Application Delivery
* Reduced Manual Operations
* Consistent Environments
* Git-Based Change Management
* Simplified Rollbacks
* Improved Security and Compliance
* Scalable Multi-Application Deployment Model

---

## Technology Stack

* Terraform
* Ansible
* GitLab CI/CD
* Docker
* Kubernetes
* Azure Kubernetes Service (AKS)
* Azure Container Registry (ACR)
* Application Gateway (AGIC)
* Azure DNS
* Argo CD
* GitOps
* Node.js
* Express.js

---

## Author

**Logasundaram S**

DevOps Engineer | Azure | Kubernetes | Terraform | GitLab CI/CD | Argo CD | GitOps
