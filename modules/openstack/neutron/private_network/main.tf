resource "openstack_networking_network_v2" "this" {
  name     = var.network_name
  shared   = var.is_shared
  external = var.is_external
}

resource "openstack_networking_subnet_v2" "this" {
  name            = var.subnet_name
  network_id      = openstack_networking_network_v2.this.id
  cidr            = var.subnet_range
  gateway_ip      = var.gateway_ip
  enable_dhcp     = var.is_dhcp_enabled
  dns_nameservers = var.dns_nameservers

  allocation_pool {
    start = var.subnet_allocation_pool_start
    end   = var.subnet_allocation_pool_end
  }
}
