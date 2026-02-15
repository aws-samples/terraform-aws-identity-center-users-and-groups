# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

variable "groups" {
  type    = string
  default = null
}

variable "identity_store_id" {
  description = "eg d-1234567890"
  type        = string
  default     = ""
}

variable "users" {
  type    = string
  default = null
}

