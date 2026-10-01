output "security_group_id" {
  value = openstack_networking_secgroup_v2.this.id
}

output "security_group_name" {
  value = openstack_networking_secgroup_v2.this.name
}

output "security_group_rules" {
  value = { for rule_name, rule in openstack_networking_secgroup_rule_v2.rules :
    rule_name => {
      id             = rule.id
      protocol       = rule.protocol
      port_range_min = rule.port_range_min
      port_range_max = rule.port_range_max
      remote_ip      = rule.remote_ip_prefix
    }
  }
}
