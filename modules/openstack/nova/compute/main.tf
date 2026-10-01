resource "openstack_compute_instance_v2" "vm" {
  count           = var.no_of_vm
  name            = "${var.instance_name}-${count.index + 1}"
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  key_pair        = var.key_pair
  security_groups = [var.security_group]

  network {
    name = var.network_name
  }
}
