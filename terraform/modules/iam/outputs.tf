output "firehose_delivery_role_arn" {
  value       = aws_iam_role.firehose_role.arn
  description = "Firehose Role Raw Delivery ARN"
}

output "lambda_to_kinesis_stream_role_arn" {
  value       = aws_iam_role.lambda_raw_to_kinesis_stream_role.arn
  description = "Lambda To Kinesis Role ARN"
}