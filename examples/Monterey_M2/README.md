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

| Name | Description |
|------|-------------|
| <a name="output_ec2_arn"></a> [ec2\_arn](#output\_ec2\_arn) | n/a |
| <a name="output_ec2_iam_role_name"></a> [ec2\_iam\_role\_name](#output\_ec2\_iam\_role\_name) | n/a |
| <a name="output_ec2_ipv6_addresses"></a> [ec2\_ipv6\_addresses](#output\_ec2\_ipv6\_addresses) | n/a |
| <a name="output_ec2_private_ip"></a> [ec2\_private\_ip](#output\_ec2\_private\_ip) | n/a |
| <a name="output_ec2_public_ip"></a> [ec2\_public\_ip](#output\_ec2\_public\_ip) | n/a |
| <a name="output_host_arn"></a> [host\_arn](#output\_host\_arn) | n/a |
| <a name="output_host_id"></a> [host\_id](#output\_host\_id) | n/a |
| <a name="output_mac_ami_architecture"></a> [mac\_ami\_architecture](#output\_mac\_ami\_architecture) | n/a |
| <a name="output_mac_ami_description"></a> [mac\_ami\_description](#output\_mac\_ami\_description) | n/a |
| <a name="output_mac_ami_id"></a> [mac\_ami\_id](#output\_mac\_ami\_id) | n/a |
| <a name="output_mac_ami_name"></a> [mac\_ami\_name](#output\_mac\_ami\_name) | n/a |
<!-- END_TF_DOCS -->