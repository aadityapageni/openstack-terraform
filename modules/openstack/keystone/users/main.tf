resource "openstack_identity_user_v3" "this" {
  for_each           = toset(var.user_names)
  name               = each.key
  default_project_id = var.project_id
  password           = var.user_passwords[each.key]
}

resource "openstack_identity_role_assignment_v3" "this" {
  for_each   = openstack_identity_user_v3.this
  user_id    = each.value.id
  project_id = var.project_id
  role_id    = var.role_id
}
