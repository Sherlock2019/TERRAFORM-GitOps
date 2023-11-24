# QuickSight for Dashboards (modules/quicksight/main.tf)

resource "aws_quicksight_group" "example" {
  group_name = "example-group"
  aws_account_id = data.aws_caller_identity.current.account_id
}

resource "aws_quicksight_user" "example" {
  user_name  = "example_user"
  email      = "user@example.com"
  role       = "READER"
  identity_type = "IAM"
  user_role = "READER"
  aws_account_id = data.aws_caller_identity.current.account_id
}


