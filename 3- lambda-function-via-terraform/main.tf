provider "aws"{
    region = "ap-south-1"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "${path.module}/python/hello-python.zip"
  function_name = "hello-lambda-func"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_handler"
  runtime = "python3.8"
  }

  data "archive_file" "zip_the_python_code" {
    type = "zip"
    source_dir = "${path.module}/python/"
    output_path = "${path.module}/python/hello-python.zip"
  }