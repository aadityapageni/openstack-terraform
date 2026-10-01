data "openstack_networking_port_v2" "instance" {
  count = var.port_id == null && var.instance_id != null ? 1 : 0

  device_id  = var.instance_id
  network_id = var.network_id
}

resource "openstack_networking_floatingip_v2" "this" {
  description = var.description
  pool        = var.pool
  port_id     = local.port_id
  fixed_ip    = var.fixed_ip
  tags        = var.tags

  lifecycle {
    precondition {
      condition     = (var.instance_id != null) != (var.port_id != null)
      error_message = "Exactly one of instance_id or port_id must be set."
    }
  }
}

locals {
  port_id = var.port_id != null ? var.port_id : try(data.openstack_networking_port_v2.instance[0].id, null)
}
