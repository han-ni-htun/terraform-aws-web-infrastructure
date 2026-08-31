resource "aws_instance" "hellocloud" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.hellocloud.id
  vpc_security_group_ids = [aws_security_group.hellocloud.id]

  user_data_replace_on_change = true

  user_data = <<-EOF
              #!/bin/bash
              dnf install -y httpd
              systemctl enable httpd
              systemctl start httpd

              cat <<HTML > /var/www/html/index.html
              <html>
                <body>
                  <h1>Hello Cloud from Terraform 🚀</h1>
                  <p>This EC2 instance was created with Terraform.</p>
                </body>
              </html>
              HTML
              EOF

  tags = {
    Name = "${var.prefix}-web-server"
  }
}