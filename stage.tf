resource "google_cloudbuild_trigger" "stage" {
  name     = "cloud-run-demo-stage"
  project  = "kv-cloud-run-3"
  disabled = false
  filename = "cloudbuild.yaml"
  github {
    owner = "hhcauldwell"
    name  = "cloud-run-demo"
    push {
      branch = "^stage$"
    }
  }
  substitutions = {
    _SERVICE       = "cloud-run-demo-stage"
    _CPUS          = 1
    _MEMORY        = "2G"
    _MIN_INSTANCES = 0
    _MAX_INSTANCES = 10
  }
}
