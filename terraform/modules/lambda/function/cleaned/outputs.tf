output "lambda_processor_arn" {
  value = aws_lambda_function.lambda_processor.arn
  description = "Lambda Function ARN"
}

output "lambda_function_name" {
  value = aws_lambda_function.lambda_processor.function_name
  description = "Function Name of Lambda Function"
}