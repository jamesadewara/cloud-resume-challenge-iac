variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for resource naming prefixes"
  type        = string
  default     = "resume"
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

variable "mongodb_url" {
  description = "MongoDB Atlas connection string (matches backend .env)"
  type        = string
  sensitive   = true
}

variable "mongodb_db_name" {
  description = "MongoDB database name"
  type        = string
  default     = "resume_db"
}

variable "allowed_origins" {
  description = "Comma-separated list of allowed CORS origins"
  type        = string
  default     = "http://localhost:3000,null"
}

variable "github_org" {
  description = "Your GitHub username or org (e.g., jamesadewara)"
  type        = string
}

variable "backend_repo_name" {
  description = "Your backend repo name (e.g., resume-api)"
  type        = string
  default     = "cloud-resume-challenge-backend"
}

variable "resume_repo_name" {
  description = "Your resume repo name (e.g., resume-frontend)"
  type        = string
  default     = "cloud-resume-challenge-resume"
}