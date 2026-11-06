module "nxos" {
  source  = "netascode/nac-nxos/nxos"
  version = "0.4.1"

  yaml_directories     = ["data/"]
  template_directories = ["templates/"]
}
