locals {
  service_name = "base-iac"

  common_tags = {
    service_name = local.service_name
    author       = "carlos angulo"
    iac          = "terraform"
    repo         = "cangulo-tf/basic-iac"
  }

  root_organitzation_id = data.aws_organizations_organization.root.roots[0].id

  s3bucket_tfstate = "basic-iac-tfstate"

  resource_group_tags = {
    app_version     = var.app_version
    deployment_time = var.deployment_time
  }

}
