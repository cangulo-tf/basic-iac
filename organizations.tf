resource "aws_organizations_organizational_unit" "top_ou" {
  for_each  = toset(var.top_org_units)
  name      = each.value
  parent_id = local.root_organitzation_id
}

module "organization_apps" {
  source    = "./modules/organization_module"
  for_each  = { for app in var.apps : app.name => app }
  name      = each.value.name
  parent_id = aws_organizations_organizational_unit.top_ou["apps"].id
  accounts  = each.value.accounts
  envs      = each.value.envs
}
