source "amazon-ebs" "aws-ebs" {
  profile = var.profile
  region = var.region
  ami_name = "${local.resource_name_prefix}-custom-image"
  instance_type = var.instance_type
  source_ami = var.base_ami  # Ubuntu Server 18.04 LTS (HVM), SSD Volume Type
  communicator = "ssh"
  ssh_username = "ubuntu"
  shutdown_behavior = "terminate"

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
    App = "${var.prefix}"
    Env = "${var.environment}"
    OS = "Ububtu 18.04 LTS"
    Name = "${local.resource_name_prefix}-custom-image"
    BaseAMIID = "{{ .SourceAMI }}"
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
      "echo 'AMI has been built successfully.'"
    ]
  }
}
