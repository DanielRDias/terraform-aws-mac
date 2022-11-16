provider "aws" {
  region = "eu-central-1"
}

module "mac" {
  source        = "../../"
  macos_version = "11"   # macOS Big Sur
  mac_type      = "mac1" # x86_64_mac
  subnet_id     = "subnet-xxx"

  tags = {
    Name        = "Terraform Mac"
    Terraform   = "true"
    Environment = "dev"
  }
}
