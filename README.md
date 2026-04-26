# 🏗️ Cloud Resume Challenge - Infrastructure (IaC)

This directory contains the **Terraform** configuration to provision and manage the AWS and Cloudflare infrastructure for the Cloud Resume Challenge.

## 📐 Architecture Overview

The infrastructure is modularized for clarity and reusability:

- **S3 Static Site**: Hosts the frontend HTML/CSS/JS.
- **Cloudflare DNS**: Manages domain records and provides SSL/TLS.
- **Lambda API**: Provisions the serverless function and API Gateway.
- **GitHub OIDC**: Securely allows GitHub Actions to deploy without long-lived credentials.

## 🚀 Getting Started

### 1. Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) >= 1.5.0
- AWS CLI configured with appropriate permissions.
- Cloudflare API Token.

### 2. Initialization
```bash
terraform init
```

### 3. Configuration
Copy the example variables file and fill in your values:
```bash
cp terraform.tfvars.example terraform.tfvars
```

### 4. Deployment
```bash
terraform plan
terraform apply
```

## 📂 Module Descriptions

| Module | Purpose |
| :--- | :--- |
| `s3-static-site` | Creates the S3 bucket and configures it for website hosting. |
| `cloudflare-dns` | Hooks up your domain to the S3 bucket via CNAME records. |
| `lambda-api` | Sets up the API Gateway and Lambda skeleton for the backend. |
| `github-oidc` | Configures IAM roles for secure CI/CD from GitHub. |

## 🔐 Security
State is managed remotely in an S3 bucket with DynamoDB locking (as configured in `main.tf`). Ensure your `terraform.tfvars` is never committed to version control.