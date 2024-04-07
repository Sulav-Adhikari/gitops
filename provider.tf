

terraform {
    required_version = "=1.7.5"

  # backend "s3"  {
  #   bucket         = "sulav-terraform-state"
  #   key            = "terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "Sulav_terraform_state"
  # }

  
}

provider "aws" {
    region = "us-east-1"
    shared_credentials_files = ["/home/sulav/.aws/credentials"]
    shared_config_files = ["/home/sulav/.aws/config"]

}