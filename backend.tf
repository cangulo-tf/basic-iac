terraform {
  backend "s3" {
    bucket  = "basic-iac-tfstate" # make it match with local.s3bucket_tfstate
    key     = "basic-iac"
    region  = "eu-west-1" #var.aws_region 
    profile = "default"   #var.aws_profile
  }
}
