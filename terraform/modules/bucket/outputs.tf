output "bucket_arn" {
  value       = aws_s3_bucket.raw_bucket.arn
  description = "S3 destination Bucket ARN"
}