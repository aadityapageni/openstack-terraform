# Create firewall rules
resource "openstack_fw_rule_v2" "rules" {
  for_each = { for rule in var.firewall_rules : rule.name => rule }

  name             = each.value.name
  description      = each.value.description
  action           = each.value.action
  protocol         = each.value.protocol
  destination_port = each.value.destination_port
  enabled          = each.value.enabled
}

# Create firewall policy
resource "openstack_fw_policy_v2" "this" {
  name       = var.firewall_policy_name
  project_id = var.project_id
  rules      = [for rule in openstack_fw_rule_v2.rules : rule.id]
}
