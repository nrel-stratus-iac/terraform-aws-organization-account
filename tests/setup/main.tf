module "defaults" {
  source = "./../.."
  providers = {
    aws.master = aws.master
  }
  org          = "opstest"
  account_name = "NREL AWS TERRAFORM TEST DELETEME"
  billingId    = "999999"
  email        = null
}

module "specifics" {
  source = "./../.."
  providers = {
    aws.master = aws.master
  }
  org          = "opstest"
  account_name = "NREL AWS TERRAFORM TEST DELETEME"
  email        = "testdeleteme@email.com"
  billingId    = "999999"
}