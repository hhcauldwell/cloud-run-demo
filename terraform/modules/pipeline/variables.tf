variable service {
  type = string
}

variable project {
  type = string
}

variable repo {
  type = string
}

variable slots {
  type = map(object({
    branch = string
    cpus = number
    memory = string
    min = number
    max = number
  }))
}
