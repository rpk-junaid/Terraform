terraform {
  backend "s3" {
    bucket = "rpk-junaid-terraform"
    key = "core/terraform.tf"
    region = "ap-south-1"
  }
}