#-----------------------------------------------------------
# written by: Lawrence McDaniel
#             https://lawrencemcdaniel.com/
#
# date: Feb-2023
#
# usage: install Kubecost https://www.kubecost.com/
#-----------------------------------------------------------
terraform {
  required_version = "~> 1.3"

  required_providers {
    local = "~> 2.2"
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.8"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.16"
    }
  }
}
