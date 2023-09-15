provider "aws" {
  region = "us-east-1"
}

### Backend ###
# S3
###############

terraform {
  backend "s3" {
    bucket = ""
    key = ""
    region = ""
  }
}

####
resource "aws_iam_role_policy" "lambda-policy" {
  name         = "lambda_policy"
  role = "${aws_iam_role.lambda_role.id}"
  policy = "${file("iam/lambda-policy.json")}"
}

resource "aws_iam_role" "lambda_role" {
name   = "lambda_role"
assume_role_policy = "${file("iam/lambda-assume-policy.json")}"
}
