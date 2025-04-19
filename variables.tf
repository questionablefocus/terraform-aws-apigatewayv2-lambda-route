variable "api_id" {
  type        = string
  description = "The ID of the API Gateway"
}

variable "api_execution_arn" {
  type        = string
  description = "The execution ARN of the API Gateway"
}

variable "lambda_invoke_arn" {
  type        = string
  description = "The invoke ARN of the Lambda function"
}

variable "lambda_function_name" {
  type        = string
  description = "The name of the Lambda function"
}

variable "route_key" {
  type        = string
  description = "The route key for the API Gateway route"
}
