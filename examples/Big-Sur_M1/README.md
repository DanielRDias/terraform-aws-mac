# macOS Big Sur - mac1 - example

Configuration in this directory creates a dedicated host with a mac1.metal instance running Big Sur.

## Example source code

```hcl
provider "aws" {
  region = "eu-central-1"
}

module "dedicated-host" {
  source            = "DanielRDias/mac/aws"
  version           = "0.0.1"
  macos_version     = "11"   # macOS Big Sur
  mac_type          = "mac1" # x86_64_mac
  subnet_id         = "subnet-xxx"

  tags = {
    Name    = "Terraform Mac"
    Version = "11 macOS Big Sur"
    Type    = "mac1"
  }
}
```
