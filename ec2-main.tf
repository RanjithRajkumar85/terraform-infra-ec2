
provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "drupal_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.drupal_secuirty_group.id]
  subnet_id = var.subnet_id

  tags = var.tags

   provisioner "file" {
    source      = "drupal.sh"
    destination = "/tmp/drupal.sh"    
  }
  provisioner "file" {
    source      = "apache.conf"
    destination = "/tmp/apache.conf"    
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get -y --force-yes install apache2 libapache2-mod-php5 php5-mysql php5-gd php5-curl php5-cli",
      "chmod +x /tmp/drupal.sh"      
    ]    
  }
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

  owners = ["099720109477"] # Canonical
}


resource "aws_key_pair" "drupal_key_pair" {
  key_name   = var.key_name
  public_key = var.public_key
}

resource "aws_security_group" "drupal_secuirty_group" {
  name        = var.security_group_name
  description = "drupal-instance-sg"
  vpc_id      = var.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}