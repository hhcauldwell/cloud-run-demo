resource "google_cloudbuild_trigger" "prod" {
  name     = "cloud-run-demo"
  project  = "kv-cloud-run-3"
  disabled = false
  filename = "cloudbuild.yaml"
  github {
    owner = "hhcauldwell"
    name  = "cloud-run-demo"
    push {
      branch = "^main$"
    }
  }
  substitutions = {
    _SERVICE       = "cloud-run-demo"
    _CPUS          = 1
    _MEMORY        = 2G
    _MIN_INSTANCES = 1
    _MAX_INSTANCES = 10
  }
}
