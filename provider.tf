provider "aws" {
  region                  = var.aws_region
  profile                 = var.aws_profile
  shared_credentials_file = "$HOME/.aws/credentials"

  default_tags {
    tags = local.common_tags
  }
}
