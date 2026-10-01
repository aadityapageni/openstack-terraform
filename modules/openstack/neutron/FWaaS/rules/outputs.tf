output "firewall_rule_ids" {
  value = [for rule in openstack_fw_rule_v2.rules : rule.id]
}
