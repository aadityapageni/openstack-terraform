output "firewall_policy_id" {
  value = openstack_fw_policy_v2.this.id
}

output "firewall_policy_name" {
  value = openstack_fw_policy_v2.this.name
}

output "firewall_rule_ids" {
  value = [for rule in openstack_fw_rule_v2.rules : rule.id]
}
