provider "aws" {
  alias = "master"
}

run "execute" {
  command = plan

  providers = {
    aws.master = aws.master
  }

  module {
    source = "./tests/setup"
  }

  assert {
    condition     = module.defaults.account_email == "terraformtestdeleteme@email.com"
    error_message = "Unexpected standardized default e-mail"
  }

  assert {
    condition     = module.specifics.account_email == "testdeleteme@email.com"
    error_message = "Unexpected specified e-mail"
  }

}


run "expected_errors" {
  command = plan

  variables {
    org = "organization"
    account_name = "INVALID-DELETEME"
    email        = "email"
    billingId    = "999999999999999999999999"
  }

  expect_failures = [
    var.email,
    var.account_name,
    var.billingId,
  ]
}