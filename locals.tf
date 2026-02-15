# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

locals {
  groups_yaml = var.groups != null ? file(var.groups) : ""
  groups_list = local.groups_yaml != "" ? yamldecode(local.groups_yaml) : {}

  groups_flatten = flatten([
    for group_name, group_details in local.groups_list : [
      for user in group_details.users : {
        user  = user
        group = group_name
      } if user != null && user != ""
    ]
  ])

  users_yaml = var.users != null ? file(var.users) : ""
  users_list = local.users_yaml != "" ? yamldecode(local.users_yaml) : {}

  existing_usernames = var.users == null ? distinct([
    for group in local.groups_flatten : group.user
  ]) : []

  identity_store_id = length(var.identity_store_id) > 0 ? var.identity_store_id : tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
}

