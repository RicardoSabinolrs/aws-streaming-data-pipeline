variable "lambda_function_name" {
  description = "Name of the Lambda Function"
  type        = string
  default     = "PunkApiRaw"
}

variable "lambda_function_handler" {
  description = "Handler for Lambda function"
  type        = string
  default     = "main.lambda_handler"
}

variable "filename" {
  description = "Zipped file containing Lambda function"
  type        = string
  default     = "../lambdas/punk_api_raw/punk_api_raw.zip"
}

variable "role_arn" {
  description = "Lambda to Kinesis Stream Role ARN"
  type        = string
  default     = ""
}

variable "kinesis_stream_name" {
  description = "Pass Kinesis Stream Name in order to configure the Lambda function ingestion process"
  type        = string
  default     = "KinesisDataStreamPunkApi"
}

variable "execution_timeout" {
  description = "Timeout for Lambda Function Execution in seconds"
  type        = number
  default     = 60
}