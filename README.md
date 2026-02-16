# terraform-aws-identity-center-users-and-groups

Create AWS IAM Identity Center groups, users, and group membership with Terraform.

This pattern is twinned with [terraform-aws-identity-center](https://github.com/aws-samples/terraform-aws-identity-center).

## Module Inputs
```hcl
module "idc_users_and_groups" {
  source  = "aws-samples/identity-center-users-and-groups/aws"
  version = "1.1.0"
  groups  = "./groups.yml"
  users   = "./users.yml"
}
```
Groups, users, and group membership are defined using yaml templates. The module then handles the heavy lifting. 

Example [groups.yml](./examples/groups.yml) and [users.yml](./examples/users.yml) . 

### Optional inputs
```hcl
module "idc_users_and_groups" {
  ...
  identity_store_id = "d-1234567890" // or tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0] 
  }
```

`identity_store_id` is the identity store id. [Data Source: aws_ssoadmin_instances](https://registry.terraform.io/providers/hashicorp/awS/latest/docs/data-sources/ssoadmin_instances) can be used to fetch it. This optional input will likely become mandatory in a future build as it reduces unecessary resource refreshes. 

## Permission sets and account assignments 

This pattern does not create permission sets and account assignments. If you want to do this, use this pattern: [terraform-aws-identity-center](https://github.com/aws-samples/terraform-aws-identity-center). The modules are de-coupled to account for customers who use an external IdP. 

## Related Resources 

- [AWS IAM Identity User Guide](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html)
- [Terraform Registry: aws-samples/identity-center-users-and-groups/aws](https://registry.terraform.io/modules/aws-samples/identity-center-users-and-groups/aws/latest) 

## Security
See [CONTRIBUTING](./CONTRIBUTING.md) for more information.

## License
This library is licensed under the MIT-0 License. See the LICENSE file.
