# terraform-aws-apigatewayv2-lambda-route

A pragmatic (opinionated) Terraform module to set up a Lambda route in an API gateway.

The module is meant to be used close to the lambda resource definition, allowing for local context in the same file (e.g. `api-skeleton.tf`) while generic API gateway resources can be placed in another file (e.g. `apigateway.tf`).

## Examples

### Basic configuration

```hcl
resource "aws_apigatewayv2_api" "main" {
  name          = "api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "main" {
  api_id      = aws_apigatewayv2_api.main.id
  name        = "prod"
  auto_deploy = true
}

resource "aws_lambda_function" "skeleton" {
    # ...
}

module "skeleton_lambda_api_route" {
  source  = "./modules/aws_apigatewayv2_lambda_route"
  version = "1.0.0"

  api_id               = aws_apigatewayv2_api.main.id
  api_execution_arn    = aws_apigatewayv2_api.main.execution_arn
  lambda_invoke_arn    = aws_lambda_function.skeleton.invoke_arn
  lambda_function_name = aws_lambda_function.skeleton.function_name
  route_key            = "GET /api/skeleton/{proxy+}"
}
```
