# 🏗️ Cloud Resume Challenge - Infrastructure (IaC)
github repo: https://github.com/jamesadewara/cloud-resume-challenge-iac.git

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

| `github-oidc` | Configures IAM roles for secure CI/CD from GitHub. |
| `lambda-api` | Sets up the API Gateway and Lambda skeleton for the backend. |

## ⚙️ GitHub Actions Configuration

To support the CI/CD pipelines, you must configure the following in your GitHub repositories (**Settings > Secrets and variables > Actions**).

### Repository Variables (`vars.*`)
- `AWS_REGION`: e.g., `us-east-1`
- `S3_BUCKET_NAME`: The name of your S3 bucket (e.g., `resume.jamesadewara.com`)
- `LAMBDA_FUNCTION_NAME`: The name of your Lambda function (e.g., `resume-api`)
- `DOMAIN_NAME`: Your custom domain (e.g., `resume.jamesadewara.com`)

### Repository Secrets (`secrets.*`)
- `AWS_DEPLOY_ROLE_ARN`: The ARN of the IAM role created by the `github-oidc` module.
- `CLOUDFLARE_API_TOKEN`: (For IaC repo only) Your Cloudflare API token.
- `MONGODB_URI`: (For IaC repo only) Your MongoDB Atlas connection string.

## 🔐 Security
State is managed remotely in an S3 bucket with DynamoDB locking (as configured in `main.tf`). Ensure your `terraform.tfvars` is never committed to version control.
