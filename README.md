# terraform-aws-identity-center-users-and-groups

Create AWS IAM Identity Center groups, users, and group membership with Terraform.

This pattern is twinned with [terraform-aws-identity-center](https://github.com/aws-samples/terraform-aws-identity-center).

## Module Inputs
```hcl
module "idc_users_and_groups" {
  source  = "aws-samples/identity-center-users-and-groups/aws"
  version = "1.1.1"
  groups  = "./groups.yml"
  users   = "./users.yml"
}
```
Groups, users, and group membership are defined using yaml templates. These module inputs should point at the yaml file location. Example [groups.yml](./examples/groups.yml) and [users.yml](./examples/users.yml) . 

## Permission sets and account assignments 

Permission sets and account assignments can be created with: [terraform-aws-identity-center](https://github.com/aws-samples/terraform-aws-identity-center). The modules are de-coupled for AWS customers using an external Identity Provider (IdP). 

## Related Resources 

- [AWS IAM Identity User Guide](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html)
- [Terraform Registry: aws-samples/identity-center-users-and-groups/aws](https://registry.terraform.io/modules/aws-samples/identity-center-users-and-groups/aws/latest) 

## Security
See [CONTRIBUTING](./CONTRIBUTING.md) for more information.

## License
This library is licensed under the MIT-0 License. See the LICENSE file.
