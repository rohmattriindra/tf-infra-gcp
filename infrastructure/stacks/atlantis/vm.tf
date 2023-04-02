module "grafana" {
  source               = "../../../modules/compute-instance"
  project_id           = var.project_id
  region               = var.region
  zones                = var.zones
  instance_count       = var.instance_count
  instance_name_prefix = var.instance_name_prefix
  disk_size            = var.disk_size
  disk_image           = var.disk_image
  machine_type         = var.machine_type
  vpc                  = var.vpc
  subnet               = var.subnet
  tags                 = var.tags
  public_ip            = true # set true if you will assign the public ip
}