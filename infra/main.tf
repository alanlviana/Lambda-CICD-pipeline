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


resource "aws_lambda_function" "test_lambda" {
  function_name = var.lambda_function_name
  handler       = var.lambda_handler
  role          = aws_iam_role.execution_role.arn
  runtime = var.runtime
}