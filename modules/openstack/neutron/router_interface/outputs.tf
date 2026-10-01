output "router_interface_id" {
  value       = openstack_networking_router_interface_v2.this.id
  description = "ID of the router interface"
}
