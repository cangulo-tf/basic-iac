output "app" {
  description = "Environment Created per App"
  value       = var.app
}

output "env" {
  description = "Environment Name"
  value       = var.env
}

output "accounts" {
  description = "Environment Created per App"
  value = [for o in values(aws_organizations_account.account) : {
    name  = o.name
    email = o.email
    id    = o.id
    arn   = o.arn
  }]
}
