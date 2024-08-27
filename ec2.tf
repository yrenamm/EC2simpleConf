# EC2 Instance Creation

resource "aws_instance" "web_server_https" {
  ami           = data.aws_ami.amilinux.id
  instance_type = "t2.micro"
  key_name      = "terraform-key"

  subnet_id              = aws_subnet.vpc-httpd-public-subnet.id
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]

  tags = {
    "Name" = "VM"
    "Team" = var.team
  }
}
