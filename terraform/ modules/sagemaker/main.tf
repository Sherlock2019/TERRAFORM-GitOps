SageMaker for Machine Learning (modules/sagemaker/main.tf)

resource "aws_sagemaker_notebook_instance" "example" {
  name          = "example-notebook-instance"
  role_arn      = aws_iam_role.example.arn
  instance_type = "ml.t2.medium"
}

resource "aws_sagemaker_model" "example" {
  name = "example-model"
  // Define execution role, primary_container, etc.
}
