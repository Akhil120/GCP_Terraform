project_id              = "playground-s-11-00ddb9c9"
region                  = "us-central1"
disk_image              = "projects/debian-cloud/global/images/debian-12-bookworm-v20240701"
disk_size_gb            = 10
disk_type               = "pd-balanced"
machine_type            = "e2-medium"
instance_name           = "instance"
instance_count          = 3
network_tier            = "PREMIUM"
subnetwork              = "default"
service_account_email   = "796816593828-compute@developer.gserviceaccount.com"
service_account_scopes  = ["https://www.googleapis.com/auth/cloud-platform"]
tags                    = ["http-server", "https-server", "test-vm"]
zone                    = "us-central1-c"
