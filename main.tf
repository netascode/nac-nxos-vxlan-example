module "nxos" {
  source  = "netascode/nac-nxos/nxos"
  version = "0.4.0"

  yaml_directories     = ["data/"]
  template_directories = ["templates/"]

  write_model_file = "model.yaml"
}
