provider "aws" {
  region = "us-east-1"
}

module "mac" {
  source        = "../../"
  macos_version = "12"   # macOS Monterey
  mac_type      = "mac2" # arm64_mac
  subnet_id     = "subnet-0be4a2ca823bb5600"

  tags = {
    Name        = "Terraform Mac"
    Terraform   = "true"
    Environment = "dev"
  }
}
