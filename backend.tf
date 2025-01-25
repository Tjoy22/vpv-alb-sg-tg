terraform {
  backend "s3" {
    bucket = "w6joy-terraform-bucket"
    key    = "week10/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraforms-lock1"   
    encrypt = true
  }
}