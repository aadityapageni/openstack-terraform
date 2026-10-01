output "network_id" {
  value       = openstack_networking_network_v2.this.id
  description = "The ID of the flat network"
}

output "subnet_id" {
  value       = openstack_networking_subnet_v2.this.id
  description = "The ID of the flat subnet"
}

output "network_name" {
  value       = openstack_networking_network_v2.this.name
  description = "The name of the flat network"
}

output "subnet_name" {
  value       = openstack_networking_subnet_v2.this.name
  description = "The name of the flat subnet"
}
