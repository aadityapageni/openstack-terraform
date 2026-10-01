resource "openstack_networking_router_v2" "this" {
  name                = var.router_name
  admin_state_up      = true
  external_network_id = var.external_network_id
}
