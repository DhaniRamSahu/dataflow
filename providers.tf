provider "google" {
  credentials = file("./sa.json")
  project     = "spheric-crowbar-406014"
  region      = "eu-west1"
}
