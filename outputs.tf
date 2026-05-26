output "enabled" {
  description = "Whether the module is enabled"
  value       = local.enabled
}

output "user_arn" {
  description = "ARN of the IAM user"
  value       = try(aws_iam_user.this[0].arn, null)
}

output "user_name" {
  description = "Name of the IAM user"
  value       = try(aws_iam_user.this[0].name, null)
}

output "user_unique_id" {
  description = "Unique ID of the IAM user"
  value       = try(aws_iam_user.this[0].unique_id, null)
}
