#========================================
# create key pair for Obelion-Cloud instances 
#========================================
resource "tls_private_key" "Obelion-Cloud-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "Obelion-Cloud-key" {
  key_name   = "Obelion-Cloud-key"
  public_key = tls_private_key.Obelion-Cloud-key.public_key_openssh
  provisioner "local-exec" {
    command = "echo '${tls_private_key.Obelion-Cloud-key.private_key_pem}' > ./Obelion-Cloud-key.pem && chmod 600 ./Obelion-Cloud-key.pem"
  }
}

resource "aws_instance" "Frontend" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.Obelion-Cloud-key.key_name
  subnet_id                   = var.public_subnet_A_id
  security_groups             = [var.frontend_sg_id]
  associate_public_ip_address = true
  user_data                   = file("${path.module}/docker-script.sh")
  root_block_device {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true

    tags = {
      Name = "Frontend-volume"
    }
  }
  tags = {
    Name = "Frontend"
  }
}

resource "aws_instance" "Backend" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.Obelion-Cloud-key.key_name
  subnet_id                   = var.public_subnet_B_id
  security_groups             = [var.backend_sg_id]
  associate_public_ip_address = true
  user_data                   = file("${path.module}/backend-script.sh")

  root_block_device {
    # root block name
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true

    tags = {
      Name = "Backend-volume"
    }
  }
  tags = {
    Name = "Backend"
  }
}
