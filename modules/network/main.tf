resource "google_compute_network" "network_vpc" {
 for_each                        = { for network_vpc in var.network_vpcs : network_vpc.network_name => network_vpc }
 name                            = each.value.network_name
 auto_create_subnetworks         = each.value.auto_create_subnetworks
 routing_mode                    = each.value.routing_mode
 project                         = var.project_id
 description                     = each.value.description
 delete_default_routes_on_create = each.value.delete_default_internet_gateway_routes
 mtu                             = each.value.mtu
}