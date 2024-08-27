# Elastic IP Creation

resource "aws_eip" "my-eip" {
  instance = aws_instance.web_server_https.id

  # Elastic IP creation only after IGW
  depends_on = [aws_internet_gateway.vpc-httpd-igw]
}
