resource "google_compute_network" "vpc_network" {

  name                    = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = 1460
}


resource "google_compute_subnetwork" "subnetwork" {


  name          = var.subnet_name
  ip_cidr_range = var.ip_cidr_range
  network       = google_compute_network.vpc_network.id
  region = var.location
  

}

resource "google_compute_address" "static_ip" {
  name         = var.gitlabrunner_publicip_name
  
  address_type = "EXTERNAL"
  region       = var.location # Specify the region where the IP should be reserved
}

resource "google_compute_instance" "gitlabrunner" {
  name         = var.gitlabrunner_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image_type
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnetwork.id

    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }

  metadata_startup_script = file("install.sh")
 
}






resource "google_compute_firewall" "allow_gitlab_traffic" {
  name    = "allow-gitlab-traffic-test"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  #target_tags   = ["gitlab-server"]

  description = "Allow inbound HTTP, HTTPS, and SSH traffic for GitLab"
}

