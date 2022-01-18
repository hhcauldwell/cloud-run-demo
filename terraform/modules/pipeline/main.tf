resource "google_cloudbuild_trigger" "slots" {
  for_each = var.slots
  name     = var.service
  project  = var.project
  disabled = false
  filename = "cloudbuild.yaml"
  github {
    owner = split("/", var.repo)[0]
    name  = split("/", var.repo)[1]
    push {
      branch = "^${each.value.branch}$"
    }
  }
  substitutions = {
    _SERVICE       = each.key
    _CPUS          = each.value.cpus
    _MEMORY        = each.value.memory
    _MIN_INSTANCES = each.value.min
    _MAX_INSTANCES = each.value.max
  }
}
