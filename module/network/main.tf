resource "google_compute_network" "network" {
  name                                      = var.network_name
  auto_create_subnetworks                   = var.auto_create_subnetworks
  routing_mode                              = var.routing_mode
  project                                   = var.project_id
  description                               = var.description
  delete_default_routes_on_create           = var.delete_default_internet_gateway_routes
  mtu                                       = var.mtu
  enable_ula_internal_ipv6                  = var.enable_ipv6_ula
  internal_ipv6_range                       = var.internal_ipv6_range
  network_firewall_policy_enforcement_order = var.network_firewall_policy_enforcement_order
}

#======subnet======
resource "google_compute_subnetwork" "df-subnet" {
  count = length(var.subnet_names)
  name                     = var.subnet_names[count.index]
  ip_cidr_range            = var.subnet_cidr_ranges[count.index]
  region                   = "europe-west1"
  network                  = google_compute_network.network.self_link
  private_ip_google_access = true

  dynamic "secondary_ip_range" {
    for_each = var.secondary_ip_ranges[count.index]

    content {
      ip_cidr_range = secondary_ip_range.value
      range_name    = "secondary-range-${count.index + 1}-${secondary_ip_range.key + 1}"
    }
  }
}
