resource "aws_s3_bucket" "basic_iac_tfstate" {
  bucket = "basic-iac-tfstate"
  acl    = "private"

  versioning {
    enabled = true
  }
}
