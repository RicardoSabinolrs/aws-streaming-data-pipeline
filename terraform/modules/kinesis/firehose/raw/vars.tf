variable "kinesis_firehose_name" {
  description = "Kinesis Firehose Delivery Name"
  type        = string
  default     = "FirehoseRawDeliveryToS3"
}

variable "kinesis_firehose_buffer_interval" {
  description = "Firehose buffer interval"
  type        = number
  default     = 60
}

variable "kinesis_firehose_buffer_size" {
  description = "Firehose buffer size"
  type        = number
  default     = 1
}

variable "destination_type" {
  description = "Destination Type"
  type        = string
  default     = "s3"
}

variable "kinesis_stream_arn" {
  description = "Kinesis Strean ARN"
  type        = string
}


variable "destination_bucket_arn" {
  description = "Destination S3 bucket ARN"
  type        = string
}

variable "role_arn" {
  description = "Kinesis Firehose Role ARN"
  type        = string
}
