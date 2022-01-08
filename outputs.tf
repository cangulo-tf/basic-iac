output "resourgroup_name" {
  description = "resource group which contains all the AWS resources created."
  value       = aws_resourcegroups_group.main.name
}

output "top_ous" {
  description = "organizations and accounts created under the app organization"
  value = [for ou in values(aws_organizations_organizational_unit.top_ou) : {
    name = ou.name
    id   = ou.id
    arn  = ou.arn
  }]
}

# output "common_apps_resources_ou" {
#   description = "OU for common resources"
#   value = {
#     name = aws_organizations_organizational_unit.common_apps_resources.name
#     id   = aws_organizations_organizational_unit.common_apps_resources.id
#     arn  = aws_organizations_organizational_unit.common_apps_resources.arn
#   }
# }

# output "common_apps_resources_accounts" {
#   description = "Accounts in common_apps_resources_ou"
#   value = [for account in values(aws_organizations_account.common_app_resources_accounts) :
#     {
#       name  = account.name
#       email = account.email
#       id    = account.id
#       arn   = account.arn
#   }]
# }

# output "apps" {
#   description = "organizations and accounts created under the app organization"
#   value = [for ou in values(aws_organizations_organizational_unit.apps) : {
#     name = ou.name
#     id   = ou.id
#     arn  = ou.arn
#   }]
# }

# output "apps_envs" {
#   description = "organizations and accounts created under the app organization"
#   value       = values(module.app_envs)
# }

# output "env_accounts" {
#   description = "organizations and accounts created under the app organization"
#   value       = values(module.env_accounts)
# }
