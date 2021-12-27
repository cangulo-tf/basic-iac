output "app_name" {
  description = "Environment Created per App"
  value       = var.app_name
}

output "app_id" {
  description = "Environment Created per App"
  value       = var.app_id
}

output "envs" {
  description = "Environment Created per App"
  value = { for o in values(aws_organizations_organizational_unit.envs) : o.name => {
    id  = o.id
    arn = o.arn
  } }
}
