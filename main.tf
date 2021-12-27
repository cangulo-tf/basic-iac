resource "aws_organizations_organizational_unit" "top_ou" {
  for_each  = toset(local.top_org_units)
  name      = each.value
  parent_id = local.root_organitzation_id
}

resource "aws_organizations_organizational_unit" "apps" {
  for_each  = toset(var.apps)
  name      = each.value
  parent_id = aws_organizations_organizational_unit.top_ou["apps"].id

  depends_on = [
    aws_organizations_organizational_unit.top_ou["apps"]
  ]
}

resource "aws_organizations_organizational_unit" "common_apps_resources" {
  name      = var.common_app_resources_ou
  parent_id = aws_organizations_organizational_unit.top_ou["apps"].id

  depends_on = [
    aws_organizations_organizational_unit.top_ou["apps"]
  ]

  tags = {
    app = "common_apps_resources"
  }
}

resource "aws_organizations_account" "common_app_resources_accounts" {
  for_each  = { for a in var.common_app_resources_accounts : a.name => a }
  name      = each.value.name
  email     = each.value.email
  parent_id = aws_organizations_organizational_unit.common_apps_resources.id

  depends_on = [
    aws_organizations_organizational_unit.common_apps_resources
  ]

  tags = {
    app = "common_apps_resources"
  }
}

module "app_envs" {
  source   = "./modules/app_envs"
  for_each = aws_organizations_organizational_unit.apps
  app_name = each.value.name
  app_id   = each.value.id
  envs     = var.app_envs

  depends_on = [
    aws_organizations_organizational_unit.apps
  ]
}

module "env_accounts" {
  source   = "./modules/env_accounts"
  for_each = { for a in var.env_accounts : "${a.app}/${a.env}" => a }

  app      = each.value.app
  env      = each.value.env
  env_id   = module.app_envs[each.value.app].envs[each.value.env].id
  accounts = each.value.accounts

  depends_on = [
    module.app_envs
  ]
}
