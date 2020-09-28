variable "firehose_role_delivery_name" {
  description = "Name of the role chosen for Firehose"
  type        = string
  default     = "FirehoseRole"
}

variable "lambda_to_kinesis_stream_role_name" {
  description = "Name of the role chosen for Lambda"
  type        = string
  default     = "LambdaToKinesisRole"
}

variable "kinesis_stream_arn" {
  description = "Input Kinesis Stream ARN"
  type        = string
  default     = ""
}

variable "bucket_raw_arn" {
  description = "Destination S3 bucket ARN"
  type        = string
  default     = ""
}
variable "bucket_cleaned_arn" {
  description = "Destination S3 bucket ARN"
  type        = string
  default     = ""
}

variable "lambda_processor_name_arn" {
  description = "Destination S3 bucket ARN"
  type        = string
  default     = ""
}

variable "lambda_function_role_arn" {
  description = "Destination S3 bucket ARN"
  type        = string
  default     = "lambda_function_role"
}

variable "kinesis_firehose_stream_role_arn" {
  description = "kinesis Firehose Stream Role ARN"
  type        = string
  default     = "kinesis_firehose_stream_role"
}