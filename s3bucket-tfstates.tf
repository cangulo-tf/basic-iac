resource "aws_s3_bucket" "basic_iac_tfstate" {
  bucket = local.s3bucket_tfstate
  acl    = "private"

  versioning {
    enabled = true
  }
}
