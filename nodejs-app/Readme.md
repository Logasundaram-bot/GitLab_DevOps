# Node.js Application CI/CD Pipeline

## Overview

This repository contains a containerized Node.js application with an automated CI/CD pipeline implemented using GitLab CI/CD. The pipeline handles application build, testing, security scanning, Docker image creation, and publishing to Azure Container Registry (ACR).

The project demonstrates modern DevOps practices for application delivery and serves as the application layer in a GitOps-based Kubernetes deployment workflow.

---

## Features

* Node.js Express Application
* Health Check Endpoint (`/health`)
* Docker Containerization
* Automated CI/CD Pipeline
* Dependency Management with npm
* Security Scanning using npm audit and Trivy
* Docker Image Build & Push to Azure Container Registry (ACR)
* GitOps Ready Deployment Workflow
* Secure Credential Management using GitLab Protected & Masked Variables

---

## Application Architecture

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
Deploy New Version
```

---

## Application Endpoints

| Endpoint  | Description           |
| --------- | --------------------- |
| `/`       | Application Home Page |
| `/health` | Health Check Endpoint |

---

## CI/CD Pipeline Stages

### Build

Installs application dependencies.

```bash
npm install
```

### Test

Runs application tests.

```bash
npm test
```

### Security Scan

Performs vulnerability scanning using:

* npm audit
* Trivy

### Docker Build

Builds the application container image.

```bash
docker build -t nodejs-app .
```

### Push to ACR

Publishes the Docker image to Azure Container Registry.

---

## Dockerfile

```dockerfile
FROM node:21-alpine

WORKDIR /usr/src/app

COPY . .

RUN npm install

EXPOSE 5000

CMD ["npm", "start"]
```



## Azure Authentication in Pipeline

To allow GitLab CI/CD to push container images to Azure Container Registry (ACR), Azure credentials are stored securely as GitLab Protected and Masked Variables.

### Required Variables

```bash
AZURE_CLIENT_ID
AZURE_CLIENT_SECRET
AZURE_SUBSCRIPTION_ID
AZURE_TENANT_ID
ACR_NAME
```

### Security Best Practices

* Credentials stored as Protected & Masked Variables
* No secrets committed to source control
* Least Privilege Access Model
* Secure authentication to Azure resources

---

## Technologies Used

* Node.js
* Express.js
* Docker
* GitLab CI/CD
* Azure Container Registry (ACR)
* Trivy
* npm Audit

---

## Future Enhancements

* Helm Chart Packaging
* Kubernetes Deployment Automation
* Prometheus Monitoring
* Grafana Dashboards
* Automated Version Tagging

---

## Author

**Logasundaram S**

DevOps Engineer | Azure | Kubernetes | Terraform | GitLab CI/CD | GitOps
