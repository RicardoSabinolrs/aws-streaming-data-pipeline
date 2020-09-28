resource "aws_kinesis_firehose_delivery_stream" "kinesis_firehose_cleaned_delivery_to_bucket" {
  name = var.kinesis_firehose_name
  destination = var.destination_type

  kinesis_source_configuration {
    kinesis_stream_arn = var.kinesis_stream_arn
    role_arn           = var.role_arn
  }

  extended_s3_configuration {
    role_arn   = var.role_arn
    bucket_arn = var.destination_bucket_arn

    processing_configuration {
      enabled = "true"

      processors {
        type = "Lambda"

        parameters {
          parameter_name  = "LambdaArn"
          parameter_value = "${var.lambda_processor_name_arn}:$LATEST"
        }
      }
    }
  }
}