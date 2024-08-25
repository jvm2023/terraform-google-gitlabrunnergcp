output "nameof_gitlabrunner" {
    description = "gitlabrunner vm name on gcp"
    value = google_compute_instance.gitlabrunner.name
  
}

