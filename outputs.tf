output "website_url" {
  description = "Your HTTPS website URL"
  value       = "https://${var.domain_name}"
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = module.s3_static_site.bucket_name
}

output "lambda_api_url" {
  description = "Lambda API endpoint"
  value       = module.lambda_api.api_url
}

output "lambda_function_name" {
  description = "Lambda function name"
  value       = module.lambda_api.function_name
}

output "backend_deploy_role_arn" {
  description = "Copy to backend repo GitHub Secret: AWS_DEPLOY_ROLE_ARN"
  value       = module.github_oidc.backend_deployer_role_arn
}

output "resume_deploy_role_arn" {
  description = "Copy to resume repo GitHub Secret: AWS_DEPLOY_ROLE_ARN"
  value       = module.github_oidc.resume_deployer_role_arn
}