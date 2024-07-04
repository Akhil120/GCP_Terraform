provider "google" {
  project = var.project_id
  region  = "us-central1"
}

resource "google_compute_instance_template" "instance_template" {
  name           = "instance-template-20240704-154708"
  machine_type   = "e2-medium"
  region         = "us-central1"
  tags           = ["test-vm", "http-server", "https-server"]

  disk {
    auto_delete  = true
    boot         = true
    device_name  = "instance-template-20240704-154708"
    source_image = "projects/debian-cloud/global/images/debian-12-bookworm-v20240701"
    mode         = "READ_WRITE"
    disk_size_gb = 10
    type         = "pd-balanced"
  }

  network_interface {
    network       = "default"
  }

  service_account {
    email  = "287205428976-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  scheduling {
    automatic_restart   = false
    on_host_maintenance = "TERMINATE"
    provisioning_model  = "SPOT"
    instance_termination_action = "STOP"
  }

  shielded_instance_config {
    enable_secure_boot          = false
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  reservation_affinity {
    type = "any"
  }
}
