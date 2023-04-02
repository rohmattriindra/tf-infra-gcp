variable "project_id" {
    type        = string
    description = "gcp project id"
}

variable "region" {
    type        = string
    default     = "asia-southeast1"
    description = "gcp region"
}

variable "network" {
  type        = string
  description = "vpc id"
}

//Variable vpc network
variable "network_name" {
  description = "name of network."
}

variable "network_vpcs" {
  description = "List of custom rule definitions (refer to variables file for syntax)."
  default     = []
  type = list(object({
    network_name             = string
    routing_mode             = string
    description              = string
    auto_create_subnetworks  = bool
    delete_default_internet_gateway_routes = bool
    mtu = number
    
  }))
}

//varibale for subnets
variable "network_vpc_name" {
  description = "The name of the network being created"
}

variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}

variable "secondary_ranges" {
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  description = "Secondary ranges that will be used in some of the subnets"
  default     = {}
}