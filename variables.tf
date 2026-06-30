# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

variable "groups" {
  type    = string
  default = null
}

variable "users" {
  type    = string
  default = null
}

variable "set_email_as_primary" {
  type    = bool
  default = true
}
