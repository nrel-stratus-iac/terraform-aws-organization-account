variable "org" {
  description = "org tag value to associate with the AWS account"
  type        = string
}

variable "billingId" {
  description = "Project billingId to associate with the AWS account"
  type        = string
  validation {
    condition     = length(regexall("^\\d{6}$", var.billingId)) == 1
    error_message = "billingId must be a 6-digit ID."
  }
}

variable "account_name" {
  description = "The name of the AWS account. Must start with \"NREL AWS \" and be capitalized."
  type        = string
  validation {
    condition     = can(regex("^NREL AWS [A-Z0-9 ]+$", var.account_name))
    error_message = "Name must start with \"NREL AWS \" and be in call capital letters."
  }
}

variable "email" {
  description = "The e-mail associated with management of the AWS account."
  type        = string
}


variable "parent_ou_name" {
  description = "Name of the parent OU to make the account a child of. Defaults to \"nrel-aws\"."
  type        = string
  default     = "nrel-aws"
}