# GitOps Platform Deployment using Terraform, Ansible, and Argo CD

## Overview

This project implements a complete GitOps platform on Azure Kubernetes Service (AKS) using Terraform, Ansible, and Argo CD.

The solution follows the **App of Apps (Parent-Child Application)** pattern, where a parent Argo CD application manages multiple child applications responsible for deploying workloads and platform components across Kubernetes environments.

---

## Solution Architecture

```text
                    +----------------+
                    |   Developer    |
                    +----------------+
                             |
                             v
                    +----------------+
                    | GitLab CI/CD   |
                    +----------------+
                             |
          -----------------------------------------
          |                                       |
          v                                       v
 +-------------------+                  +------------------+
 | Terraform         |                  | Ansible          |
 | Infrastructure    |                  | Cluster Setup    |
 +-------------------+                  +------------------+
          |                                       |
          v                                       v
 +---------------------------------------------------------+
 |            Azure Kubernetes Service (AKS)               |
 +---------------------------------------------------------+
                             |
                             v
                     +---------------+
                     |   Argo CD     |
                     +---------------+
                             |
                             v
                 Parent Application (Root App)
                             |
                             v
                 
          ------------------------------------------------
          |                      |                       |
          v                      v                       v
    Child App 1           Child App 2            Child App 3
   FrontEnd App          BankEnd Stack         DataBase Stack
     +--> Deploy Pod  
     |
     +--> Create Service
     |
     +--> Create Ingress

```

---

## Infrastructure Provisioning using Terraform

Terraform is responsible for provisioning Azure resources required for the Kubernetes platform.

### Resources Created

* Resource Group
* Virtual Network (VNet)
* Subnets
* Azure Kubernetes Service (AKS)
* Azure Container Registry (ACR)
* Managed Identities
* Role Assignments
* Networking Components

Example:

```bash
terraform init
terraform plan
terraform apply
```

Benefits:

* Infrastructure as Code
* Repeatable deployments
* Version-controlled infrastructure
* Automated environment creation

---

## Cluster Bootstrap using Ansible

After AKS is provisioned, Ansible is used to configure the cluster and install platform services.

### Tasks Performed

* Connect to AKS cluster
* Install Argo CD
* Configure namespaces
* Create Argo CD parent application
---

## Argo CD Parent-Child Application Pattern

The project follows the App of Apps model.

<img width="1054" height="459" alt="image" src="https://github.com/user-attachments/assets/29acd1ac-001c-4c1c-8800-531bf675a4a9" />

### Parent Application

The parent application acts as the entry point for all deployments.

Responsibilities:

* Manages child applications
* Defines application hierarchy
* Centralized deployment management
* Simplifies onboarding of new services
---

### Child Applications

Each child application manages a specific workload or platform component and points to its own Kubernetes manifests or Helm charts.

---

## Deployment Flow

### Initial Platform Setup

```text
Terraform
    |
    v
Create AKS + ACR
    |
    v
Ansible
    |
    +--> Install Argo CD
    +--> Configure Cluster
    +--> Create Parent Application
    |
    v
Argo CD
    |
    v
Deploy Child Applications
```

### Application Release Flow

```text
Developer Commit
       |
       v
GitLab CI/CD
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
Deploy New Version
```

---

## Benefits of Parent-Child Architecture

### Scalability

New applications can be added by creating additional child applications without modifying existing deployments.

### Centralized Management

A single parent application provides visibility into all workloads deployed within the cluster.

### Reduced Operational Complexity

Platform teams manage infrastructure and cluster services while development teams manage application manifests.

### Self-Healing

Argo CD continuously reconciles cluster state with Git and automatically corrects configuration drift.

### Simplified Rollbacks

Rollback can be achieved by reverting Git commits and allowing Argo CD to synchronize the previous state.

---

## Technology Stack

* Azure Kubernetes Service (AKS)
* Terraform
* Ansible
* Argo CD
* GitLab CI/CD
* Docker
* Azure Container Registry (ACR)
* Kubernetes
* Helm

---

## Key Achievement

Implemented a fully automated GitOps platform where Terraform provisions Azure infrastructure, Ansible bootstraps Kubernetes and deploys the Argo CD Parent Application, and Argo CD manages all child applications through the App of Apps pattern, enabling scalable, self-healing, and declarative application deployments.
