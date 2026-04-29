# 🏗️ Cloud Resume Challenge - Infrastructure as Code

This repository manages the multi-cloud infrastructure for the Cloud Resume Challenge using **Terraform**. It orchestrates AWS services for compute and storage, alongside Cloudflare for global DNS and security.

## 📐 Architecture Principles

- **Modular Design**: Infrastructure is split into logical modules (S3, Lambda, DNS, OIDC) for better maintainability.
- **Remote State**: Terraform state is securely stored in S3 with versioning enabled.
- **Least Privilege**: IAM roles are scoped specifically to the needs of the Lambda function and CI/CD pipelines.
- **Security via OIDC**: Eliminates the need for long-lived AWS Access Keys in GitHub Actions by using OpenID Connect (OIDC).

## 🚀 Deployment Workflow

### 1. Prerequisites
- **Terraform 1.10+** (Uses `use_lockfile` for state locking).
- **AWS CLI** authenticated to your account.
- **Cloudflare API Token** with DNS Edit permissions.

### 2. Remote State Bootstrap
Run these once to prepare the backend:
```bash
# Create the state bucket
aws s3 mb s3://jamesadewara-terraform-state --region us-east-1

# Enable versioning for state recovery
aws s3api put-bucket-versioning --bucket jamesadewara-terraform-state --versioning-configuration Status=Enabled
```

### 3. Provisioning
```bash
terraform init
terraform plan
terraform apply
```

## 📂 Infrastructure Components

| Module | Description |
| :--- | :--- |
| [**`s3-static-site`**](./modules/s3-static-site) | Provisions the website bucket, public access settings, and Website Endpoint. |
| [**`lambda-api`**](./modules/lambda-api) | Configures the Python 3.12 Lambda, HTTP API Gateway, and environment variables. |
| [**`cloudflare-dns`**](./modules/cloudflare-dns) | Manages CNAME records and Edge settings for the custom domain. |
| [**`github-oidc`**](./modules/github-oidc) | Sets up the Trust Relationship between GitHub Actions and AWS IAM. |

## ⚙️ CI/CD Configuration (GitHub Actions)

After running `terraform apply`, use the outputs to configure your GitHub **Secrets** and **Variables**:

### For `cloud-resume-challenge-backend`
| Type | Name | Value |
| :--- | :--- | :--- |
| **Secret** | `AWS_DEPLOY_ROLE_ARN` | From `backend_deploy_role_arn` output |
| **Variable** | `LAMBDA_FUNCTION_NAME` | `resume-api` |
| **Variable** | `AWS_REGION` | `us-east-1` |
| **Variable** | `API_GATEWAY_URL` | From `lambda_api_url` output |

### For `cloud-resume-challenge-resume`
| Type | Name | Value |
| :--- | :--- | :--- |
| **Secret** | `AWS_DEPLOY_ROLE_ARN` | From `resume_deploy_role_arn` output |
| **Variable** | `S3_BUCKET_NAME` | From `s3_bucket_name` output |
| **Variable** | `AWS_REGION` | `us-east-1` |

## 🔒 State Management
This project uses a modern Terraform backend configuration:
- **Bucket**: `jamesadewara-terraform-state`
- **Locking**: Native `use_lockfile` (Terraform 1.10+) for secure concurrent access.

---
*Automated with ❤️ using Terraform.*
