resource "aws_organizations_organizational_unit" "envs" {
  for_each  = toset(var.envs)
  name      = each.value
  parent_id = var.app_id

  tags = {
    app = var.app_name
  }
}
