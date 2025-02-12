variable "lambda_function_name" {
  type = string
}

variable "lambda_handler" {
  type = string
  default = "lambda_function.lambda_handler"
}

variable "runtime" {
  type = string
  default = "python3.13"
}
