variable "zones" {
  description = "A list of Google Cloud zones in which to create the resources."
  type        = list(string)
}

variable "region" {
    type        = string
    description = "gcp region"
}

variable "project_id" {
    type        = string
    description = "gcp project id"
}

variable "instance_count" {
  description = "The number of instances to create."
}

variable "tags" {
  description = "The number of instances to create."
  type = list(string)
}

variable "machine_type" {
  description = "The number of instances to create."
}

variable "vpc" {
  description = "VPC Name."
}

variable "subnet" {
  description = "Subnet Name."
}

variable "public_ip" {
  description = "Whether to create a public IP for the instances."
  type        = bool
  default     = false
}

variable "instance_name_prefix" {
  description = "Prefix for the instance name."
  type        = string
}

variable "disk_size" {
  description = "Size of the custom disk to create."
  default     = 10
}

variable "disk_image" {
  description = "The disk image to use for the instance's OS."
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}