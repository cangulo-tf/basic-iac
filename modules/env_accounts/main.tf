

resource "aws_organizations_account" "account" {
  for_each  = { for ac in var.accounts : ac.name => ac }
  name      = each.value.name
  email     = each.value.email
  parent_id = var.env_id

  tags = {
    app = var.app
    env = var.env
  }
}
