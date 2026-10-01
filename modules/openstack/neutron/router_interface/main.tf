resource "openstack_networking_router_interface_v2" "this" {
  router_id = var.router_id
  subnet_id = var.subnet_id
}
