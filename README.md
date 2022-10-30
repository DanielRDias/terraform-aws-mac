# Terraform AWS dedicated macOS Host Module

Terraform module to create a macOS instance on AWS.

## Usage

### macOS Monterey 12 - mac2 arm64_mac

```hcl
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

### macOS Big Sur 11 - mac1 x86_64_mac

```hcl
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
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.37.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dedicated-host"></a> [dedicated-host](#module\_dedicated-host) | DanielRDias/dedicated-host/aws | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_instance.mac](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.mac](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_subnet.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_placement"></a> [auto\_placement](#input\_auto\_placement) | (Optional) Indicates whether the host accepts any untargeted instance launches that match its instance type configuration, or if it only accepts Host tenancy instance launches that specify its unique host ID. Valid values: on, off. Default: on. | `string` | `"on"` | no |
| <a name="input_host_recovery"></a> [host\_recovery](#input\_host\_recovery) | (Optional) Indicates whether to enable or disable host recovery for the Dedicated Host. Host recovery is disabled by default. | `string` | `"off"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | (Optional) Specifies the instance type to be supported by the Dedicated Hosts. If you specify an instance type, the Dedicated Hosts support instances of the specified instance type only. Default: mac1.metal. | `string` | `"mac1.metal"` | no |
| <a name="input_mac_type"></a> [mac\_type](#input\_mac\_type) | Mac CPU Architecture. Use mac1 for 64-bit mac1.metal, use mac2 for 64-bit-arm mac2.metal. Default: m1 | `string` | `"mac1"` | no |
| <a name="input_macos_version"></a> [macos\_version](#input\_macos\_version) | The macOS version number. Monterey is 12, Big-Sur is 11, Catalina is 10. Default: 12 | `string` | `"12"` | no |
| <a name="input_outpost_arn"></a> [outpost\_arn](#input\_outpost\_arn) | (Optional) The Amazon Resource Name (ARN) of the AWS Outpost on which to allocate the Dedicated Host. | `string` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | VPC Subnet ID to launch in. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A list of tags to associate with the module. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_availability_zone"></a> [availability\_zone](#output\_availability\_zone) | n/a |
| <a name="output_dedicated_host_id"></a> [dedicated\_host\_id](#output\_dedicated\_host\_id) | Dedicated Host ID |
| <a name="output_dedicated_hosts_arn"></a> [dedicated\_hosts\_arn](#output\_dedicated\_hosts\_arn) | The ARN of the Dedicated Host. |
| <a name="output_mac_ami_architecture"></a> [mac\_ami\_architecture](#output\_mac\_ami\_architecture) | n/a |
| <a name="output_mac_ami_description"></a> [mac\_ami\_description](#output\_mac\_ami\_description) | n/a |
| <a name="output_mac_ami_id"></a> [mac\_ami\_id](#output\_mac\_ami\_id) | n/a |
| <a name="output_mac_ami_name"></a> [mac\_ami\_name](#output\_mac\_ami\_name) | n/a |
<!-- END_TF_DOCS -->