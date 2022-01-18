terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "kevala"

    workspaces {
      name = "cloud-run-demo"
    }
  }
}
