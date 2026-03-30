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
  source  = "netascode/nac-nxos/nxos"
  version = "0.1.0"

  yaml_directories = ["data/"]
}
