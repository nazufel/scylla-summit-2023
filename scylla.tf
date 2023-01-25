# create GCP Instance for Scylla US East Datacenter
resource "google_compute_instance" "scylla_east_01" {
  name         = "scylla-east-01"
  machine_type = "n2-highmem-80"
  zone         = "us-east1-a"

  # give the instance labels
  labels = {
    component         = "scylla"
    cost-center       = "us-production"
    environment       = "production"
    external-sla      = "n-a"
    internal-sla      = "4-hours"
    patch-window      = "2-weeks"
    scylla-datacenter = "us-east-datacenter"
    service-owner     = "us-production-operations"
    state             = "active"
    support-window    = "24x7"
  }
}