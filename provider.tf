provider "aws" {
    region= "us-east-1"
}

resource "aws_s3_bucket" "terraformdemobucket" {
    bucket = "githubaction-terraform-demo"
    tags = {
        Name = "githubaction-terraform-demo"
    }
}