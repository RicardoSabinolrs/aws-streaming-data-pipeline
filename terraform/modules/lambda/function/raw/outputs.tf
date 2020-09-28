output "lambda_function_arn" {
  value = aws_lambda_function.lambda_function.arn
  description = "Lambda Function ARN"
}

output "lambda_function_name" {
  value = aws_lambda_function.lambda_function.function_name
  description = "Function Name of Lambda Function"
}