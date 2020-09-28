variable "kinesis_firehose_name" {
  description = "Kinesis Firehose Delivery Name"
  type        = string
  default     = "FirehoseCleanedDeliveryToS3"
}

variable "kinesis_stream_arn" {
  description = "Kinesis Strean ARN"
  type        = string
  default     = ""
}

variable "role_arn" {
  description = "Kinesis Firehose Role ARN"
  type        = string
  default     = ""
}

variable "destination_bucket_arn" {
  description = "Destination S3 bucket ARN"
  type        = string
  default     = ""
}

variable "lambda_processor_name_arn" {
  description = "Name of Lambda Function Processor"
  type        = string
  default     = "punk_api_cleaned"
}

variable "destination_type" {
  description = "Destination Type"
  type        = string
  default     = "extended_s3"
}





