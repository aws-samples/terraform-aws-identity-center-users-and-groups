# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

data "aws_ssoadmin_instances" "this" {}

data "aws_identitystore_user" "existing" {
  for_each          = var.users == null ? toset(local.existing_usernames) : toset([])
  identity_store_id = local.identity_store_id

  alternate_identifier {
    unique_attribute {
      attribute_path  = "UserName"
      attribute_value = each.key
    }
  }
}
