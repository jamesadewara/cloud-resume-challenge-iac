terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "jamesadewara-terraform-state"
    key            = "resume/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region = var.aws_region
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# 1. S3 Static Website
module "s3_static_site" {
  source      = "./modules/s3-static-site"
  bucket_name = var.bucket_name
}

# 2. Cloudflare DNS + HTTPS
module "cloudflare_dns" {
  source              = "./modules/cloudflare-dns"
  zone_id             = var.cloudflare_zone_id
  domain_name         = var.domain_name
  s3_website_endpoint = module.s3_static_site.website_endpoint
  s3_bucket_domain    = module.s3_static_site.bucket_regional_domain
}

# 3. Lambda API (Infrastructure Only)
module "lambda_api" {
  source        = "./modules/lambda-api"
  function_name = "${var.project_name}-api"
  api_name      = "${var.project_name}-api"
  mongodb_uri   = var.mongodb_uri
}

# 4. GitHub OIDC (for Backend Repo CI/CD)
module "github_oidc" {
  source              = "./modules/github-oidc"
  github_org          = var.github_org
  backend_repo_name   = var.backend_repo_name
  lambda_function_arn = module.lambda_api.function_arn
}