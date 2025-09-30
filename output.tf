output "account_id" {
  description = "AWS Account ID"
  value       = aws_organizations_account.aws_account.id
}

output "account_name" {
  description = "AWS Account Name"
  value       = aws_organizations_account.aws_account.name
}

output "account_email" {
  description = "AWS Account e-mail"
  value       = aws_organizations_account.aws_account.email
}

output "parent_ou_id" {
  description = "Organizational unit ID of the account's parent"
  value = local.account_ou_id
}