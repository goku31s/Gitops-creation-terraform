resource "google_compute_instance" "apache" {
  name         = "apache-server-${var.environment}"
  machine_type = "e2-medium"  # Adjust machine type as needed
  zone         = "us-central1-a"  # Adjust zone as needed

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"  # Ubuntu 20.04 LTS
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<-SCRIPT
    #!/bin/bash
    apt-get update
    apt-get install -y apache2
    echo "Welcome to Sukrit DevOps World from ${var.environment}" > /var/www/html/index.html
    systemctl restart apache2
  SCRIPT

  tags = ["http-server", "https-server"]
}

