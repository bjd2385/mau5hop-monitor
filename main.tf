# According to the docs, can't create email subscriptions yet, so I opted to just build the SNS manually. Works like a charm.
data "aws_sns_topic" "mau5hop" {
  name = "mau5hop"
}

# Also built out this here role for my Lambda to use during execution, so it has access to the SNS topic above.
data "aws_iam_role" "mau5shop-execution-role" {
  name = "mau5shop-execution"
}

