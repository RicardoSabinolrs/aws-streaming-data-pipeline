variable "kinesis_stream_name" {
  description = "Kinesis Stream Name"
  type        = string
  default     = "KinesisStreamPunkApi"
}

variable "kinesis_shard_count" {
  description = "Number of shards in Kinesis Stream"
  type        = number
  default     = 1
}

variable "kinesis_retention_period" {
  description = "Hours that the data records are accessible after they are added to the stream. Values must be between 24 and 168."
  type        = number
  default     = 24
}
