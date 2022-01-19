module "pipeline" {
  source  = "./modules/pipeline"
  service = "cloud-run-demo"
  project = "kv-cloud-run-3"
  repo    = "hhcauldwell/cloud-run-demo"
  slots   = {
    "cloud-run-demo": {
      branch = "main"
      cpus   = 1
      memory = "1G"
      min    = 3
      max    = 10
    },
    "cloud-run-demo-stage": {
      branch = "stage"
      cpus   = 1
      memory = "1G"
      min    = 0
      max    = 10
    },
    "cloud-run-demo-test": {
      branch = "test"
      cpus   = 1
      memory = "1G"
      min    = 0
      max    = 3
    }
  }
}
