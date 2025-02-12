data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "execution_role" {
  name               = "execution-role-${var.lambda_function_name}"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}


resource "aws_lambda_function" "lambda_cicd_example" {
  function_name = var.lambda_function_name
  handler       = var.lambda_handler
  role          = aws_iam_role.execution_role.arn
  filename = "../function.zip"
  source_code_hash = filebase64sha256("../function.zip")
  runtime = var.runtime
}