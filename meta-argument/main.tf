/*
count = 2
depends_on =
for_each
lifecycle
*/
//provider "aws" {
   // region = "us-east-1"

/*

resource "aws_instance" "s1" {
    count = 1
    ami = "ami-0c614dee691cbbf37"
instance_type = "t2.micro"


tags = {
    name = "dev-server${count.index}"

}
}
resource "aws_iam_user" "us1" {
    name = "cloudadmin"
    depends_on = [aws_instance.s1]
}
output "ip" {
    value = aws_instance.s1[*].public_ip
}
*/
variable "typeofinstance" {
    type = list(string)
    default = ["t2.micro", "t3.small"]
    }

    variable "info"{
       type = map(object({
        ami = string
        instance =string
        
       }))
       default = {
       dev = {ami: "ami-0c614dee691cbbf37" , instance: "t2.micro"}
       qa =  {ami: "ami-0c614dee691cbbf37abcd" , instance: "t2.micro"}
    }
    }
    /*
    resource "aws_instance" "s2" {
        for_each = toset(var.typeofinstance)
        ami = "ami-0c614dee691cbbf37"
        instance_type = each.key
    }
    */

/*
    resource "aws_instance" "s2" {
        for_each = var.info
        ami = each.value.ami
        instance_type = each.value.instance

        tags = {
            name = each.key
        }
    }
    */

    /*provider "aws" {
        region = var.region
      
    }
   variable "region"{
        description = "value 0f region"
        type = string
       sensitive = true
      // default = "us-east-1"
    }
    */      
   /* provider "aws" {
  region = us-east-1
  alias = "us1"
}
provider "aws" {
  region = us-west-2
  alias = "usw2"
 # Provider meta argument
 }
resource "aws_instance" "example" {
  provider = aws.us1
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
*/
provider "aws" {
  region = "us-east-1"
  alias = "useast1"
}
resource "aws_instance" "example" {
  provider = aws.useast1
  ami = "ami-0c614dee691cbbf37"
  instance_type = "t2.micro"
  lifecycle {
   //create_before_destroy = true
   prevent_destroy = false
  }
}
