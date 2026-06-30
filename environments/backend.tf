terraform {
  backend "s3" {
    bucket = "production-datalake-dev-tf-state-926046660390"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}