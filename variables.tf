variable "project_id" {
  description = "The project ID to deploy resources in"
  type        = string
}

variable "region" {
  description = "The region to deploy resources in"
  type        = string
}

variable "disk_image" {
  description = "Disk image to use for instances"
  type        = string
  default     = "projects/debian-cloud/global/images/debian-12-bookworm-v20240701"
}

variable "disk_size_gb" {
  description = "Disk size in GB"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "Disk type"
  type        = string
  default     = "pd-balanced"
}

variable "machine_type" {
  description = "The machine type to use for instances"
  type        = string
  default     = "e2-medium"
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
  default     = "instance-1"
}

variable "network_tier" {
  description = "Network tier"
  type        = string
  default     = "PREMIUM"
}

variable "subnetwork" {
  description = "Subnetwork to attach instances to"
  type        = string
}

variable "service_account_email" {
  description = "Service account email to associate with instances"
  type        = string
}

variable "service_account_scopes" {
  description = "Scopes to associate with instances"
  type        = list(string)
  default     = ["https://www.googleapis.com/auth/cloud-platform"]
}

variable "tags" {
  description = "Tags to associate with instances"
  type        = list(string)
  default     = ["http-server", "https-server", "test-vm"]
}

variable "zone" {
  description = "The zone to deploy resources in"
  type        = string
  default     = "us-central1-c"
}
