output "bucket_name" {
  value = aws_s3_bucket.website.id
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
}

output "bucket_regional_domain" {
  value = aws_s3_bucket.website.bucket_regional_domain_name
}