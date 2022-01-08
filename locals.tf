locals {
  service_name = "base-iac"

  top_org_units = ["suspended-accounts"]

  common_tags = {
    service_name = local.service_name
    author       = "carlos angulo"
    iac          = "terraform"
    repo         = "cangulo-tf/basic-iac"
  }

  root_organitzation_id = data.aws_organizations_organization.root.roots[0].id
}
