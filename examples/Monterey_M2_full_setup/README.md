# macOS Monterey - mac2 - example

Configuration in this directory creates a dedicated host with a mac2.metal instance running Monterey.
The instance root block device will be encrypted and has 50GB in size.
Metadata options are enabled but require HTTP token authentication.
The security group only allows ssh ingress to a specific IP, but you can adjust it if you have additional requirements.

## Example source code

```hcl
provider "aws" {
  region = "us-east-1"
}

module "mac" {
  source        = "../../"
  macos_version = "12"   # macOS Monterey
  mac_type      = "mac2" # arm64_mac
  subnet_id     = "subnet-xxx"

  key_name = "my-mac-ssh-key-name" # in case you don't have an ssh key yet go to the "AWS console > ec2 > Key pairs" and create one

  vpc_security_group_ids = [aws_security_group.ssh.id]

  enable_volume_tags = false
  root_block_device = [
    {
      encrypted   = true
      volume_type = "gp3"
      throughput  = 200
      volume_size = 50
      tags = {
        Name = "my-mac-root-block"
      }
    }
  ]

  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
    instance_metadata_tags      = "enabled"
  }

  tags = {
    Name        = "Terraform Mac"
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  # vpc_id = vpc-xxx # add your vpc in case you are not using the default VPC

  ingress {
    description = "SSH ingress access only to your IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["123.4.5.6/32"] # replace 123.4.5.6 with your IP 
  }

  # Uncomment this code if you want to allow all internet egress access
  # egress {
  #   description = "Egress access to everything on the internet"
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  tags = {
    Name = "allow_ssh"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.55.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mac"></a> [mac](#module\_mac) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

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