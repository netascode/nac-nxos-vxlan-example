[![Terraform Version](https://img.shields.io/badge/terraform-%5E1.9-blue)](https://www.terraform.io)

# Network-as-Code - Example for NX-OS VXLAN

This example is part of the Cisco [*Network as Code*](https://netascode.cisco.com) project. Its goal is to allow users to instantiate infrastructure in minutes using an easy to use, opinionated data model. It takes away the complexity of having to deal with references, dependencies or loops. By completely separating data (defining variables) from logic (infrastructure declaration), it allows the user to focus on describing the intended configuration while using a set of maintained and tested Terraform Modules without the need to understand the low-level configuration details. More information can be found here: <https://netascode.cisco.com>.

## Setup

All steps are driven by the [`nac`](https://github.com/netascode/nac) CLI, an umbrella tool wrapping Terraform/OpenTofu, [nac-validate](https://github.com/netascode/nac-validate) and [nac-test](https://github.com/netascode/nac-test). Its settings (render target, required environment variables) are defined in [`nac.yaml`](https://github.com/netascode/nac-nxos-vxlan-example/blob/main/nac.yaml).

Install [Terraform](https://www.terraform.io/downloads) (> 1.9.0) or [OpenTofu](https://opentofu.org/docs/intro/install/), and the `nac` CLI:

```shell
uv tool install nac-cli
nac setup
```

`nac` uses `tofu` if available, otherwise `terraform`. `nac-validate` and `nac-test` are run from a local installation if present, or via `uvx` otherwise.

Set environment variables with credentials:

```shell
export NXOS_USERNAME=admin
export NXOS_PASSWORD=password
```

Update device IPs in [`data/inventory.nac.yaml`](https://github.com/netascode/nac-nxos-vxlan-example/blob/main/data/inventory.nac.yaml).

## Initialization

```shell
nac init
```

This command downloads all the required providers and modules from the public registry ([Terraform Registry](https://registry.terraform.io) or [OpenTofu Registry](https://search.opentofu.org), depending on the engine).

## Pre-Change Validation

```shell
nac validate
```

This command renders the YAML input files in `data/` and the templates in `templates/` into a `model.yaml` file, which contains the complete configuration of each device, and then performs syntactic and semantic validation of the rendered configuration. The schema and validation rules ship with the `nac-nxos` Terraform module and are picked up automatically after `nac init`.

## Plan/Apply

```shell
nac plan
nac apply
```

The first command creates a plan (`plan.tfplan`) of the changes required to reach the desired configuration. The second command applies the saved plan. Running `nac apply` without a saved plan plans and applies interactively.

## Testing

```shell
nac test
```

This command renders and executes a set of tests that compare the configuration on the devices against the rendered `model.yaml`, and provides the results in a combined report (`tests/results/combined_summary.html`). The test templates ship with the `nac-nxos` Terraform module and are picked up automatically after `nac init`.

## Destroy

```shell
nac destroy
```

This command deletes all the previously created configuration.
