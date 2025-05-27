/**
 * # AWS EKS Crossplane Terraform module
 *
 * A Terraform module to deploy the [Crossplane](https://www.crossplane.io/) on Amazon EKS cluster.
 *
 * [![Terraform validate](https://github.com/lablabs/terraform-aws-eks-crossplane/actions/workflows/validate.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-crossplane/actions/workflows/validate.yaml)
 * [![pre-commit](https://github.com/lablabs/terraform-aws-crossplane/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-crossplane/actions/workflows/pre-commit.yml)
*/

locals {
  addon = {
    name = "crossplane"

    helm_chart_version = "1.20.0-rc.0.140.g629ca2e2f"
    helm_repo_url      = "https://charts.crossplane.io/master/"
  }

  addon_irsa = {
    (local.addon.name) = {
      irsa_policy_enabled = local.irsa_policy_enabled
      irsa_policy         = var.irsa_policy != null ? var.irsa_policy : try(data.aws_iam_policy_document.this[0].json, "")
    }
  }

  addon_values = yamlencode({})

  addon_depends_on = []
}
