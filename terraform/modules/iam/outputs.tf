output "firehose_delivery_raw_role_arn" {
  value       = aws_iam_role.firehose_delivery_role.arn
  description = "Firehose Role Raw Delivery ARN"
}

output "lambda_to_kinesis_stream_role_arn" {
  value       = aws_iam_role.lambda_to_kinesis_stream_role.arn
  description = "Lambda To Kinesis Role ARN"
}

output "firehose_delivery_cleaned_role_arn" {
  value       = aws_iam_role.firehose_delivery_role.arn
  description = "Lambda (Cleaned) To Kinesis Role ARN"
}

output "kinesis_firehose_stream_role_arn" {
  value       = aws_iam_role.kinesis_firehose_stream_role.arn
  description = "Lambda (Cleaned) Role ARN"
}

output "lambda_function_role" {
  value       = aws_iam_role.lambda_function_role.arn
  description = "Lambda (Cleaned) Role ARN"
}
