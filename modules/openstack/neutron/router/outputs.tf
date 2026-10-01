output "router_id" {
  value       = openstack_networking_router_v2.this.id
  description = "The ID of the created router"
}

output "router_name" {
  value       = openstack_networking_router_v2.this.name
  description = "The name of the created router"
}
