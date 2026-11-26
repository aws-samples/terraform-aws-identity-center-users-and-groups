# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# For the principal_ids input of terraform-aws-identity-center.
# Keys are known at plan time, so IDs can be used before principals exist.
output "principal_ids" {
  description = "Group and user IDs, keyed by display name and user name."
  value = {
    groups = { for group in aws_identitystore_group.this : group.display_name => group.group_id }
    # keyed on the yaml user name, not a value read from AWS
    users = merge(
      { for name, user in data.aws_identitystore_user.existing : name => user.user_id },
      { for name, user in aws_identitystore_user.this : name => user.user_id },
    )
  }
}
