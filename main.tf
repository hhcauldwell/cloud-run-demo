resource "google_cloudbuild_trigger" "build_and_deploy" {
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
}
