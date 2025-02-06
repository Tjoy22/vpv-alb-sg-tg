
resource "aws_instance" "web" {
  ami                                  = "ami-0c614dee691cbbf37"
  associate_public_ip_address          = true
  availability_zone                   = "us-east-1a"
  instance_type                        = "t2.micro"
 
  key_name                             = "devkeytest"
  monitoring                           = false
  
  
  subnet_id                            = "subnet-0ac65edd01f2522da"
  tags = {
    Name = "terraform-import"
  }
  tags_all = {
    Name = "terraform-import"
  }
  
  vpc_security_group_ids      = ["sg-0f2e9865887f21adc"]
 
}
