resource "openstack_fw_rule_v2" "rules" {
  for_each = { for rule in var.firewall_rules : rule.name => rule }

  name             = each.value.name
  description      = each.value.description
  action           = each.value.action
  protocol         = each.value.protocol
  destination_port = each.value.destination_port
  enabled          = each.value.enabled
}
