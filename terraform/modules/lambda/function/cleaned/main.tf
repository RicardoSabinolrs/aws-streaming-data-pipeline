resource "aws_lambda_function" "lambda_processor" {
  function_name    = var.lambda_function_name
  handler          = var.lambda_function_handler
  role             = var.role_arn
  runtime          = "python3.8"
  filename         = var.filename
  source_code_hash = filebase64sha256(var.filename)
  timeout          = var.execution_timeout
}


