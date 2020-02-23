# AWS EC2 Instance Terraform module with SSH
This is a simple module for creating EC2 instance with SSH Access. 

# AWS EC2 Instance Terraform module

Terraform module which creates EC2 instance(s) on AWS.

These types of resources are supported:

* [EC2 instance](https://www.terraform.io/docs/providers/aws/r/instance.html)

## Terraform versions

Terraform 0.12. Pin module version to `~> v2.0`. 

## Usage

```hcl
module "ec2_cluster" {
  source                 = "github.com/rlnchow/terraform-ec2-instance-ssh"

  name                   = "my-cluster"
  instance_count         = 5

  region                 = "us-east-1"
  ami                    = "ami-ebd02392"
  vpc_id                 = "vpc-123456
  key_name               = "user1"
  public_key             = "/User/Ravipati/.ssh/id_rsa.pub" # Physical location of Key.
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| region | Region where to spin up EC2 instance | string | n/a | yes |
| ami\_id | ID of AMI to use for the instance | string | n/a | yes |
| vpc\_id | VPC ID | string | `"standard"` | yes |
| public\_key | Location of Public ID on workstation | bool | `"false"` | yes |

## Outputs

| Name | Description |
|------|-------------|
| ec2\_ip | Public IP address for instance  |
| ec2\_id | Instance ID |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Credits.

This module is created by using verified modules from Hashicorp
* [terraform-aws-ec2-instance](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance)
* [terraform-aws-security-group](https://github.com/terraform-aws-modules/terraform-aws-security-group)

## License

[GNU GENERAL PUBLIC LICENSE](LICENSE)
