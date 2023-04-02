module "firewall" {
    source              = "../../../modules/firewall"
    network_name        = var.network_name
    project_id          = var.project_id
    rules               = var.rules

}