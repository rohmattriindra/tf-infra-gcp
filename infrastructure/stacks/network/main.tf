# VPC and Subnet
module "vpc" {
    source              = "../../../modules/network"
    network_vpc_name    = var.network_vpc_name
    network             = var.network
    network_name        = var.network_name
    subnets             = var.subnets
    project_id          = var.project_id
    network_vpcs        = var.network_vpcs

}

resource "google_compute_global_address" "private_ip_alloc" {
  name          = "private-ip-alloc"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  address       = "10.49.0.0"
  prefix_length = 20
  network       = var.network
}

resource "google_project_service" "servicenetworking" {
  provider = google-beta
  project  = var.project_id
  service  = "servicenetworking.googleapis.com"
  depends_on = [
    module.vpc
  ]
}

# Create a private connection
resource "google_service_networking_connection" "private_connection" {
  network                 = var.network
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]
  depends_on = [
    google_project_service.servicenetworking
  ]
}

resource "google_compute_network_peering_routes_config" "peering_routes" {
  peering = google_service_networking_connection.private_connection.peering
  network = "vpc-staging"
  project = var.project_id

  import_custom_routes = true
  export_custom_routes = true
  depends_on = [
    google_service_networking_connection.private_connection
  ]
}
