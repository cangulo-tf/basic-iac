output "org_name" {
  value = aws_organizations_organizational_unit.org_instance.name
}

output "org_id" {
  value = aws_organizations_organizational_unit.org_instance.id
}

output "org_arn" {
  value = aws_organizations_organizational_unit.org_instance.arn
}

output "accounts" {
  value = length(local.accounts) > 0 ? [for ac in local.accounts : ac.email] : []
}

output "envs" {
  value = length(local.envs) > 0 ? [for ac in local.envs : ac.name] : []
}
