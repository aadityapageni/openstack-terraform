output "floating_ip_id" {
  value       = openstack_networking_floatingip_v2.this.id
  description = "The ID of the floating IP"
}

output "floating_ip_address" {
  value       = openstack_networking_floatingip_v2.this.address
  description = "The allocated floating IP address"
}

output "port_id" {
  value       = local.port_id
  description = "The port the floating IP is associated with"
}
