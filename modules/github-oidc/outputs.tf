output "backend_deployer_role_arn" {
  value = aws_iam_role.backend_deployer.arn
}

output "resume_deployer_role_arn" {
  value = aws_iam_role.resume_deployer.arn
}