#This tf file is for define terraform & other provider versions
terraform {
    required_version = "~>1.0"

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "> 3.0"
        }
        kubectl = {
            source = "gavinbunney/kubectl"
            version = ">= 1.14.0"
        }
        helm = {
            source = "hashicorp/helm"
            version = "> 2.6.0"
        }
    }
}

#Provider Block
provider "aws" {
    #region = var.aws_region
    region = "us-east-2"
    #shared_credentials_files = ["~/.aws/credentials"]
    #profile = "default"
}