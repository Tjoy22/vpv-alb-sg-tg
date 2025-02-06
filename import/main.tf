provider "aws" {
    region = "us-east-1"
  
}
import {
  to = aws_instance.web
  id = "i-082f2488aaf410212"
}