output "function_name" {
  value = aws_lambda_function.api.function_name
}

output "function_arn" {
  value = aws_lambda_function.api.arn
}

output "api_url" {
  value = aws_apigatewayv2_stage.prod.invoke_url
}