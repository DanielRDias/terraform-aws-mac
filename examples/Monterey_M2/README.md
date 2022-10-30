# macOS Monterey - mac2 - example

Configuration in this directory creates a dedicated host with a mac2.metal instance running Monterey.

## Example source code

```hcl
provider "aws" {
  region = "us-east-1"
}

module "dedicated-host" {
  source            = "DanielRDias/mac/aws"
  version           = "0.0.1"
  macos_version     = "12"   # macOS Monterey
  mac_type          = "mac2" # arm64_mac
  subnet_id         = "subnet-xxx"

  tags = {
    Name    = "Terraform Mac"
    Version = "12 macOS Monterey"
    Type    = "mac2"
  }
}
```
