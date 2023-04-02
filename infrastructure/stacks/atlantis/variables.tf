variable "zones" {
  description = "A list of Google Cloud zones in which to create the resources."
  type        = list(string)
}

variable "region" {
    type        = string
    default     = "asia-southeast1"
    description = "gcp region"
}

variable "project_id" {
    type        = string
    description = "gcp project id"
}

variable "tags" {
  description = "The number of instances to create."
  type = list(string)
}

variable "instance_count" {
  description = "The number of instances to create."
}

variable "public_ip" {
  description = "Whether to create a public IP for the instances."
  type        = bool
  default     = false
}

variable "vpc" {
  description = "VPC Name."
}

variable "subnet" {
  description = "Subnet Name."
}

variable "machine_type" {
  description = "The number of instances to create."
}

variable "instance_name_prefix" {
  description = "Prefix for the instance name."
  default     = "vm-fms-production"
}

variable "disk_size" {
  description = "Size of the custom disk to create."
  default     = 10
}

variable "disk_image" {
  description = "The disk image to use for the instance's OS."
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}