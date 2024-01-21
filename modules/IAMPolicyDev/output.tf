output "policy" {
  value = aws_iam_policy.dev.policy
  description = "Policy exported from `aws_iam_policy`"
}