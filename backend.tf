terraform {
  backend "s3" {
    bucket  = "basic-iac-tfstate"
    key     = "basic-iac"
    region  = "eu-west-1"
    profile = "default"
  }
}
