resource "openstack_networking_secgroup_v2" "this" {
  name        = var.security_group_name
  description = var.description
}

resource "openstack_networking_secgroup_rule_v2" "rules" {
  for_each          = { for rule in var.rules : rule.name => rule }
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = each.value.protocol
  port_range_min    = each.value.port_min
  port_range_max    = each.value.port_max
  remote_ip_prefix  = each.value.remote_ip
  security_group_id = openstack_networking_secgroup_v2.this.id
}
