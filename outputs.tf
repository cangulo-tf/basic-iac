output "apps" {
  value = [for o in values(module.organization_apps) : {
    name     = o.org_name
    id       = o.org_id
    arn      = o.org_arn
    accounts = length(o.accounts) > 0 ? "${length(o.accounts)} accounts has been created" : "no accounts provided"
    envs     = length(o.envs) > 0 ? "${length(o.envs)} environments has been created" : "no envs provided"
  }]
}

output "resourgroup_name" {
  value = aws_resourcegroups_group.main.name
}
