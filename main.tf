provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_instance" "instance-1" {
  boot_disk {
    auto_delete = true
    device_name = "instance-1"

    initialize_params {
      image = var.disk_image
      size  = var.disk_size_gb
      type  = var.disk_type
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = var.machine_type
  name         = var.instance_name

  network_interface {
    access_config {
      network_tier = var.network_tier
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/${var.project_id}/regions/${var.region}/subnetworks/${var.subnetwork}"
  }

  scheduling {
    automatic_restart   = false
    on_host_maintenance = "TERMINATE"
    preemptible         = true
    provisioning_model  = "SPOT"
  }

  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = var.tags
  zone = var.zone
}
