source "amazon-ebs" "aws-ebs" {
  profile = var.profile
  region = var.region
  ami_name = "DemoCustomAMI"
  instance_type = var.instance_type
  communicator = "ssh"
  ssh_username = "ubuntu"
  source_ami = var.base_ami  # Ubuntu Server 18.04 LTS (HVM), SSD Volume Type

  //  source_ami_filter {
  //    filters = {
  //       virtualization-type = "hvm"
  //       name = "ami-0dd9f0e7df0f0a138"
  //       root-device-type = "ebs"
  //    }
  //    owners = ["amazon"]
  //    most_recent = true
  //  }

  //  launch_block_device_mappings {
  //    device_name = "/dev/xvda"
  //    volume_size = 20
  //    volume_type = "gp2"
  //    delete_on_termination = true
  //  }

  tags = {
    Name = "CustomImageForLearning"
    OS = "Ububtu 18.04 LTS"
    Base-AMI-ID = "{{ .SourceAMI }}"
  }
}

build {
  sources = [
    "source.amazon-ebs.aws-ebs"
  ]

  provisioner "shell" {
    script = "./shell/install_software_packages.sh"
  }
  provisioner "shell-local" {
    inline = [
      "echo 'Message from a successful packer build.'"
    ]
  }
}
