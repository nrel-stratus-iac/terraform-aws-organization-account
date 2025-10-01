locals {
  tags = {
    org       = var.org
    billingId = var.billingId
  }

  account_name_stub = lower(replace(replace(var.account_name, "NREL AWS ", ""), " ", ""))
}

data "aws_organizations_organization" "nrel_aws_root_org" {
  provider = aws.master
}

data "aws_organizations_organizational_unit_descendant_organizational_units" "nested_ous" {
  provider  = aws.master
  parent_id = data.aws_organizations_organization.nrel_aws_root_org.roots[0].id
}

locals {
  target_ou = [for ou in
    data.aws_organizations_organizational_unit_descendant_organizational_units.nested_ous.children :
  ou if ou.name == var.parent_ou_name][0]
}

locals {
  account_ou_id = local.target_ou.id
}


resource "aws_organizations_account" "aws_account" {
  provider  = aws.master
  name      = var.account_name
  email     = var.email
  parent_id = local.account_ou_id
  role_name = "AWSCloudFormationStackSetExecutionRole"

  close_on_deletion = false

  tags = local.tags

  lifecycle {
    prevent_destroy = false
  }
}
