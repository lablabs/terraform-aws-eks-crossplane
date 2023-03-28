terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.59.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.18.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.9.0"
    }
    utils = {
      source  = "cloudposse/utils"
      version = ">= 0.17.0" #1.7.1
    }
  }
}
