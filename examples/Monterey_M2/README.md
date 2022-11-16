# macOS Monterey - mac2 - example

Configuration in this directory creates a dedicated host with a mac2.metal instance running Monterey.

## Example source code

```hcl
provider "aws" {
  region = "us-east-1"
}

module "dedicated-host" {
  source            = "DanielRDias/mac/aws"
  version           = "1.0.0"
  macos_version     = "12"   # macOS Monterey
  mac_type          = "mac2" # arm64_mac
  subnet_id         = "subnet-xxx"

  tags = {
    Name        = "Terraform Mac"
    Terraform   = "true"
    Environment = "dev"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mac"></a> [mac](#module\_mac) | ../../ | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->