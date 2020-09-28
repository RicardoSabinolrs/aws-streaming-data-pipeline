resource "aws_kinesis_firehose_delivery_stream" "kinesis_firehose_delivery_to_bucket" {
  name = var.kinesis_firehose_name
  destination = var.destination_type

  kinesis_source_configuration {
    kinesis_stream_arn = var.kinesis_stream_arn
    role_arn           = var.role_arn
  }

  s3_configuration {
    role_arn        = var.role_arn
    bucket_arn      = var.destination_bucket_arn
    buffer_size     = var.kinesis_firehose_buffer_size
    buffer_interval = var.kinesis_firehose_buffer_interval
  }
}