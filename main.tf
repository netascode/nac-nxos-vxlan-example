terraform {
  required_providers {
    nxos = {
      source = "CiscoDevNet/nxos"
    }
  }
}

# export NXOS_USERNAME=username
# export NXOS_PASSWORD=password

module "nxos" {
  source = "github.com/netascode/terraform-nxos-nac-nxos"

  yaml_directories = ["data/"]
}
