###################################
#              IAM
###################################
variable "firehose_raw_role_name" {
  description = "Name of the role chosen for Firehose"
  type        = string
  default     = "FirehoseRawRole"
}

variable "lambda_raw_to_kinesis_stream_role_name" {
  description = "Name of the role chosen for Lambda"
  type        = string
  default     = "LambdaRawToKinesisRole"
}

variable "firehose_cleaned_role_name" {
  description = "Name of the role chosen for Firehose"
  type        = string
  default     = "FirehoseCleanedRole"
}

variable "lambda_cleaned_to_kinesis_stream_role_name" {
  description = "Name of the role chosen for Lambda"
  type        = string
  default     = "LambdaCleanedToKinesisRole"
}

###################################
#            Kinesis
###################################
variable "kinesis_stream_name" {
  description = "Kinesis Stream Name"
  type        = string
  default     = "KinesisDataStreamPunkApi"
}

variable "kinesis_shard_count" {
  description = "Number of shards in Kinesis Stream"
  type        = number
  default     = 1
}

variable "kinesis_retention_period" {
  description = "The time period from when a record is added to when it is no longer accessible is called the retention period."
  type        = number
  default     = 24
}

###################################
#            Firehose
###################################
variable "firehose_cleaned_name" {
  description = "Kinesis Firehose Delivery Name"
  type        = string
  default     = "FFirehoseCleanedDeliveryToS3"
}

variable "firehose_raw_name" {
  description = "Kinesis Firehose Delivery Name"
  type        = string
  default     = "FirehoseRawDeliveryToS3"
}

variable "firehose_buffer_interval" {
  description = "Firehose buffer interval"
  type        = number
  default     = 60
}
variable "firehose_buffer_size" {
  description = "Firehose buffer size"
  type        = number
  default     = 5
}

###################################
#              S3
###################################
variable "bucket_name_raw" {
  description = "AWS S3 bucket name"
  type        = string
  default     = "punkapi-brew-raw-bucket-sabino"
}

variable "bucket_name_cleaned" {
  description = "AWS S3 bucket name"
  type        = string
  default     = "punkapi-brew-cleaned-bucket-sabino"
}

###################################
#             Lambda
###################################
variable "lambda_function_raw_name" {
  description = "Name of the Lambda Function"
  type        = string
  default     = "PunkApiRaw"
}

variable "lambda_function_cleaned_name" {
  description = "Name of the Lambda Function"
  type        = string
  default     = "PunkApiCleaned"
}

variable "lambda_function_handler" {
  description = "Handler for Lambda function"
  type        = string
  default     = "main.lambda_handler"
}

variable "lambda_function_raw_filename" {
  description = "Zipped file containing Lambda function"
  type        = string
  default     = "../lambdas/punk_api_raw/punk_api_raw.zip"
}

variable "lambda_function_cleaned_filename" {
  description = "Zipped file containing Lambda function"
  type        = string
  default     = "../lambdas/punk_api_cleaned/punk_api_cleaned.zip"
}

