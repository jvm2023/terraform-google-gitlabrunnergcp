variable "project" {
  type    = string
  

}

variable "location" {
  type = string
  description = "The GCP region"
  
}

variable "zone" {
  type = string
  description = "The GCP zone"
  
}

variable "vpc_name" {
  type=string
  description = "sepatre vpc name for gitlabrunner"
  
}


variable "subnet_name" {
  type = string
  description = "name of git lab subnet"
  

}

variable "ip_cidr_range" {
  type = string
  description = "iprange"
  

}

variable "gitlabrunner_name" {
    type = string
    description = "gitlab runner name"
  
}


variable "machine_type" {
    type = string
    description = "machine type for gitlab runner"
  
}

variable "image_type" {
    type = string
    description = "underlying os image type for gitlabrunner"
  
}


variable "gitlabrunner_publicip_name" {
    description = "static external ip name"
    type = string
  
}
