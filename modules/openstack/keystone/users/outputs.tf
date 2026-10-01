output "user_ids" {
  value = { for k, v in openstack_identity_user_v3.this : k => v.id }
}
