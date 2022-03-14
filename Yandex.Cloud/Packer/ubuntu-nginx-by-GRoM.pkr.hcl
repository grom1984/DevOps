source "yandex" "ubuntu-nginx-by-grom" {
  token               = "AQAAAAAOQaUjAATuwa4jAcXXXXXXXXXXXXX"
  folder_id           = "b1gdbqjhXXXXXXXXXXX"
  source_image_family = "ubuntu-2004-lts"
  ssh_username        = "ubuntu"
  use_ipv4_nat        = "true"
  image_description   = "my custom ubuntu with nginx"
  image_family        = "ubuntu-2004-lts"
  image_name          = "ubuntu-nginx-by-grom"
  subnet_id           = "e9be8s9kfcXXXXXXXXXX"
  disk_type           = "network-hdd"
  zone                = "ru-central1-a"
}
 
build {
  sources = ["source.yandex.ubuntu-nginx-by-grom"]
 
  provisioner "shell" {
    inline = ["sudo apt-get update -y", 
              "sudo apt-get install -y nginx", 
              "sudo systemctl enable nginx.service"
             ]
  }
}
