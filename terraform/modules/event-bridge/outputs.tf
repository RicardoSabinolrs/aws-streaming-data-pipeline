output "cloud_watch_event_rule_arn" {
  value       = aws_cloudwatch_event_rule.scheduler.arn
  description = "Cloud Watch Event Rule ARN"
}