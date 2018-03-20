provider "aws" {
  region = "us-east-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  key_name = "mykey"
  tags {
    Name = "HelloWorld"
  }
   provisioner "remote-exec" {
    inline = [
      "sudo apt update && sudo apt install nginx -y",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("/home/jenkins/workspace/lab01/jenkins/")}"
    }

  }
}
resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7FeJnZEgFU4VWq/UuTNAwjd46bsuM3hMRKce+xNq47e4pUBGlzFsYg5JJqTG0m1z/BKS9gGdSogIRxi9lVKaRCrLq+3istV2q6uttFON5FQfuYW3hgA8OPLgigrVYN9I7k4401ThZ2MSN3CdIsOyfv1KaEFSOPNaoFja2H5LiXaxwf8OhvNUL01Sd+YR2fXunvNgGeU1SW/pLn4IQdMlC5ZxasgdZ2ZA+Z4O0RKAjupBlRpsimGm3SybGuhDO5qis73yGfgLqzjpT9dWiXaMxfLPqpprh8Lq/tWkQR9e1rixhDFp5gFzi78wanFtiqEcFVVPQFv3nuGl5CcMfubbV"
}

output "ip"{
value= "${aws_instance.web.public_ip}"
}
