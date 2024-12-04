[![Terraform Version](https://img.shields.io/badge/terraform-%5E1.8-blue)](https://www.terraform.io)

# Network-as-Code - Example for NX-OS VXLAN

This example is part of the Cisco [*Network as Code*](https://netascode.cisco.com) project. Its goal is to allow users to instantiate infrastructure in minutes using an easy to use, opinionated data model. It takes away the complexity of having to deal with references, dependencies or loops. By completely separating data (defining variables) from logic (infrastructure declaration), it allows the user to focus on describing the intended configuration while using a set of maintained and tested Terraform Modules without the need to understand the low-level configuration details. More information can be found here: <https://netascode.cisco.com>.

## Getting Started

Install [Terraform](https://www.terraform.io/downloads) (> 1.8.0) and set environment variables with credentials:

```shell
export NXOS_USERNAME=admin
export NXOS_PASSWORD=password
```

Update device IPs in [`data/inventory.nac.yaml`](https://github.com/netascode/nac-nxos-vxlan-example/blob/main/data/inventory.nac.yaml).

Download all the required providers and modules.

```shell
terraform init
```

Apply and deploy the desired configuration.

```shell
terraform apply
```
