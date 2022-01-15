resource "google_cloudbuild_trigger" "test" {
  name     = "cloud-run-demo-test"
  project  = "kv-cloud-run-3"
  disabled = false
  filename = "cloudbuild.yaml"
  github {
    owner = "hhcauldwell"
    name  = "cloud-run-demo"
    push {
      branch = "^test$"
    }
  }
  substitutions = {
    _SERVICE       = "cloud-run-demo-test"
    _CPUS          = 1
    _MEMORY        = "2G"
    _MIN_INSTANCES = 0
    _MAX_INSTANCES = 10
  }
}
