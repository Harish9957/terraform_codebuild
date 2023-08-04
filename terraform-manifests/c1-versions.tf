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

     # Adding Backend as S3 for Remote State Storage
    backend "s3" {
        bucket = "aws-codebuild-for-ec2"
        key    = "iacdevops/terraform.tfstate"
        region = "us-east-2" 
        dynamodb_table = "iacdevops-dev-tf"

    }  
}

#Provider Block
provider "aws" {
    #region = var.aws_region
    region = "us-east-2"
    #shared_credentials_files = ["~/.aws/credentials"]
    #profile = "default"
}

     
