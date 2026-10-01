# clean-hcl

Universal, reusable Terraform modules for OpenStack — a cleaned-up version of
`infra-provisioning/` with no environment-specific roots, no commented-out code,
and the latest OpenStack provider pinned (`3.4.0`).

## Requirements

| Name | Version |
|------|---------|
| terraform | `>= 1.5.0` |
| openstack (`terraform-provider-openstack/openstack`) | `3.4.0` |

## Provider configuration

These modules are provider-agnostic: configure the OpenStack provider in the
root module that consumes them.

```hcl
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "3.4.0"
    }
  }
}

provider "openstack" {
  auth_url     = var.auth_url
  user_name    = var.user_name
  password     = var.password
  project_name = var.project_name
  region       = var.region
}
```

## Modules

| Module | Description |
|--------|-------------|
| `modules/openstack/keystone/project` | OpenStack project |
| `modules/openstack/keystone/roles` | OpenStack role |
| `modules/openstack/keystone/users` | Users + role assignments in a project |
| `modules/openstack/glance/image` | Glance image (imported from URL) |
| `modules/openstack/glance/image_member` | Share a Glance image with a project |
| `modules/openstack/neutron/flat_network` | Flat/provider network + subnet |
| `modules/openstack/neutron/private_network` | Private network + subnet |
| `modules/openstack/neutron/router` | Router (attached to an external network) |
| `modules/openstack/neutron/router_interface` | Attach a subnet to a router |
| `modules/openstack/neutron/securitygroup` | Security group + ingress rules |
| `modules/openstack/neutron/floating_ip` | Allocate a floating IP and assign it to an instance |
| `modules/openstack/neutron/FWaaS/policy` | FWaaS rules grouped into a policy |
| `modules/openstack/neutron/FWaaS/rules` | Standalone FWaaS rules |
| `modules/openstack/nova/compute` | N compute instances |

## Example usage

```hcl
module "flat_network" {
  source = "./modules/openstack/neutron/flat_network"

  network_name           = "flat-net"
  subnet_name            = "flat-subnet"
  subnet_range           = "10.20.30.0/24"
  gateway_ip             = "10.20.30.1"
  subnet_allocation_pool_start = "10.20.30.25"
  subnet_allocation_pool_end   = "10.20.30.27"
}

module "compute" {
  source = "./modules/openstack/nova/compute"

  no_of_vm        = 2
  instance_name   = "member"
  image_name      = "ubuntu-22.04"
  flavor_name     = "m1.small"
  key_pair        = "my-keypair"
  security_group  = "default"
  network_name    = module.flat_network.network_name
}

# Assign a floating IP to the first created instance
module "floating_ip" {
  source = "./modules/openstack/neutron/floating_ip"

  pool        = "public" # name of the external network
  instance_id = module.compute.vm_ids[0]
}
```

### Floating IP notes

- Set exactly one of `instance_id` (port is looked up automatically) or
  `port_id` (explicit port) — a `precondition` enforces this.
- If the instance has multiple NICs, pass `network_id` so the correct port is
  selected.
- Requires the OpenStack provider **v3+**: the legacy
  `openstack_compute_floatingip_*` APIs were removed, this module uses the
  Neutron APIs (`openstack_networking_floatingip_v2`).

## Layout

```
clean-hcl/
└── modules/
    └── openstack/
        ├── glance/
        ├── keystone/
        ├── neutron/
        └── nova/
```

## Validation

```sh
for d in $(find modules -type d -mindepth 3); do
  (cd "$d" && terraform init -backend=false -input=false >/dev/null && terraform validate)
done
terraform fmt -recursive -check
```
