terraform {
  backend "s3" {
    bucket = "githubaction-terraform-demo"
    key    = "githubaction-terraform-demo.tfstate"
    region = "us-east-1"
  }
}
