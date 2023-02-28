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
