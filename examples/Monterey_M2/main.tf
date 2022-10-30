provider "aws" {
  region = "us-east-1"
}

module "mac" {
  source        = "../../"
  macos_version = "12"   # macOS Monterey
  mac_type      = "mac2" # arm64_mac
  subnet_id     = "subnet-xxx"

  tags = {
    Name    = "Terraform Mac"
    Version = "12 macOS Monterey"
    Type    = "mac2"
  }
}
