variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "resume"
}

variable "bucket_name" {
  description = "S3 bucket name (must match your domain)"
  type        = string
}

variable "domain_name" {
  description = "Your domain (e.g., resume.jamesadewara.com)"
  type        = string
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "mongodb_uri" {
  description = "MongoDB Atlas connection string"
  type        = string
  sensitive   = true
}

variable "github_org" {
  description = "Your GitHub username or org (e.g., jamesadewara)"
  type        = string
}

variable "backend_repo_name" {
  description = "Your backend repo name (e.g., resume-api)"
  type        = string
  default     = "resume-api"
}