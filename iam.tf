locals {
  irsa_policy_enabled = var.irsa_policy_enabled != null ? var.irsa_policy_enabled : coalesce(var.irsa_assume_role_enabled, false) == false
}

data "aws_iam_policy_document" "this" {
  count = var.enabled && var.irsa_policy == null && local.irsa_policy_enabled ? 1 : 0

  # Example statement (modify it before using this module)
  statement {
    sid = "Autoscaling"

    actions = [
      "autoscaling:DescribeAutoScalingGroups",
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeLaunchConfigurations",
      "autoscaling:DescribeTags",
      "autoscaling:SetDesiredCapacity",
      "autoscaling:TerminateInstanceInAutoScalingGroup",
      "ec2:DescribeLaunchTemplateVersions",
      "ec2:DescribeInstanceTypes"
    ] # checkov:skip=CKV_AWS_111

    resources = [
      "*",
    ]

    effect = "Allow"
  }
}
