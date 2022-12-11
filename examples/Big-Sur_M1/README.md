# macOS Big Sur - mac1 - example

Configuration in this directory creates a dedicated host with a mac1.metal instance running Big Sur.

## Example source code

```hcl
provider "aws" {
  region = "eu-central-1"
}

module "dedicated-host" {
  source            = "DanielRDias/mac/aws"
  version           = "1.0.0"
  macos_version     = "11"   # macOS Big Sur
  mac_type          = "mac1" # x86_64_mac
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

| Name | Description |
|------|-------------|
| <a name="output_mac_ami_architecture"></a> [mac\_ami\_architecture](#output\_mac\_ami\_architecture) | n/a |
| <a name="output_mac_ami_description"></a> [mac\_ami\_description](#output\_mac\_ami\_description) | n/a |
| <a name="output_mac_ami_id"></a> [mac\_ami\_id](#output\_mac\_ami\_id) | n/a |
| <a name="output_mac_ami_name"></a> [mac\_ami\_name](#output\_mac\_ami\_name) | n/a |
<!-- END_TF_DOCS -->