resource "aws_organizations_organizational_unit" "org_instance" {
  name      = var.name
  parent_id = var.parent_id
}


resource "aws_organizations_account" "this" {
  for_each  = { for ac in local.accounts : ac.name => ac }
  name      = each.value.name
  email     = each.value.email
  parent_id = aws_organizations_organizational_unit.org_instance.id

  tags = local.common_tags
}

resource "aws_organizations_organizational_unit" "envs" {
  for_each  = { for e in local.envs : e.name => e }
  name      = each.value.name
  parent_id = aws_organizations_organizational_unit.org_instance.id

  tags = local.common_tags
}

resource "aws_organizations_account" "env_accounts" {
  for_each  = { for e_vs_ac in local.env_vs_account : "${e_vs_ac.env_name}-${e_vs_ac.ac_name}" => e_vs_ac }
  name      = each.value.ac_name
  email     = each.value.ac_email
  parent_id = aws_organizations_organizational_unit.envs[each.value.env_name].id

  tags = merge(local.common_tags, {
    environment = each.value.env_name
  })
}
