packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = ">= 1.0.0"
    }
  }
}

source "amazon-ebs" "node_ami" {
  region        = "us-east-1"
  instance_type = "t2.micro"
  ssh_username  = "ubuntu"

  ami_name      = "node-ansible-ami-{{timestamp}}"

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      virtualization-type = "hvm"
      root-device-type    = "ebs"
    }
    owners      = ["099720109477"]
    most_recent = true
  }
}

build {
  sources = ["source.amazon-ebs.node_ami"]

  provisioner "ansible" {
  playbook_file = "../ansible/playbook.yml"

  extra_arguments = [
    "--roles-path=../ansible/roles"
  ]
}
}
