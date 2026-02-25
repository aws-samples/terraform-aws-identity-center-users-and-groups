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

variable "template_variables" {
  description = "Variables to substitute in yaml templates (.yml.tpl and .yaml.tpl files)"
  type        = map(any)
  default     = {}
}

