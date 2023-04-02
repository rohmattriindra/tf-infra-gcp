resource "google_compute_address" "static_ip" {
  #count        = var.instance_count
  count        = var.public_ip ? var.instance_count : 0
  name         = "static-ip-${var.instance_name_prefix}-${count.index + 1}"
  address_type = "EXTERNAL"
}

resource "google_compute_instance" "vm_instance" {
  count        = var.instance_count
  name         = "${var.instance_name_prefix}-${count.index + 1}"
  machine_type = var.machine_type
  project      = var.project_id
  zone         = var.zones[count.index % length(var.zones)]
  tags		     = var.tags


  metadata = {
    enable-oslogin = true
  }

  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  network_interface {
    network    = var.vpc
    subnetwork = var.subnet
    dynamic "access_config" {
      for_each = var.public_ip ? [""] : []
      content {
        nat_ip = google_compute_address.static_ip.*.address[count.index]
      }
    }
  }
}

resource "google_compute_disk" "vm_disk" {
  count   = var.instance_count
  project = var.project_id
  name    = "disk-${var.instance_name_prefix}-${count.index + 1}"
  size    = var.disk_size
  type    = "pd-ssd"
  zone    = var.zones[count.index % length(var.zones)]
  image   = var.disk_image
}