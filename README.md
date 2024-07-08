# Terraform Configuration for Deploying Multiple VMs on GCP

This Terraform configuration allows you to deploy multiple virtual machines (VMs) on Google Cloud Platform (GCP). The configuration uses variables to externalize values that might differ across projects, making it easy to customize and reuse.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) 4.25.0 or later
- A Google Cloud Platform account
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)

## Setup

1. **Clone the repository or copy the configuration files to your local machine.**

2. **Navigate to the project directory:**

    ```sh
    cd path/to/terraform_project
    ```

3. **Initialize the Terraform project:**

    ```sh
    terraform init
    ```

4. **Create a `terraform.tfvars` file to define the values for the variables:**

    ```sh
    touch terraform.tfvars
    ```

    Populate the `terraform.tfvars` file with the required values:

    ```hcl
    project_id              = "your-project-id"
    region                  = "your-region"
    disk_image              = "projects/debian-cloud/global/images/debian-12-bookworm-v20240701"
    disk_size_gb            = 10
    disk_type               = "pd-balanced"
    machine_type            = "e2-medium"
    instance_name           = "instance"
    instance_count          = 3
    network_tier            = "PREMIUM"
    subnetwork              = "default"
    service_account_email   = "your-service-account-email"
    service_account_scopes  = ["https://www.googleapis.com/auth/cloud-platform"]
    tags                    = ["http-server", "https-server", "test-vm"]
    zone                    = "us-central1-c"
    ```

5. **Review the Terraform plan to see what resources will be created:**

    ```sh
    terraform plan
    ```

6. **Apply the Terraform configuration to create the resources:**

    ```sh
    terraform apply
    ```

    Confirm the apply action by typing `yes` when prompted.

## Configuration Details

### `main.tf`

This file contains the main Terraform configuration for creating the VM instances. It includes the resource definition for `google_compute_instance`, with the `count` parameter used to create multiple instances based on the value of `instance_count`.

### `variables.tf`

This file defines the variables used in the Terraform configuration. Each variable has a description and a type, with some having default values.

### `terraform.tfvars`

This file contains the values for the variables defined in `variables.tf`. By externalizing these values, you can easily customize the configuration for different projects or environments.

## Customization

To customize the configuration for your needs, modify the values in the `terraform.tfvars` file. You can change the number of instances, machine type, disk size, and other parameters as required.

## Cleanup

To destroy the resources created by this Terraform configuration, run:

```sh
terraform destroy
