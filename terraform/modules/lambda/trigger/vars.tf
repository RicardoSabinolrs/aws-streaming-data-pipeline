variable "lambda_function_name" {
  description = "Name of the Lambda Function"
  type        = string
  default     = "PunkApiCollector"
}

variable "source_arn" {
  description = "Cloud Watch Scheduler ARN"
  type        = string
  default     = ""
}