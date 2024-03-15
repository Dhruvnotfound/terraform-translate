data "archive_file" "zip" {
  type        = "zip"
  source_file = "translate.py"
  output_path = "translate.zip"
}

resource "aws_lambda_function" "translate_lambda" {
  filename         = data.archive_file.zip.output_path
  source_code_hash = data.archive_file.zip.output_base64sha256
  function_name    = "translateDoc"
  role             = aws_iam_role.lambda_role.arn
  handler          = "translate.lambda_handler"

  runtime = "python3.12"

  tags = {
    name = "translate"
  }
}


resource "aws_s3_bucket_notification" "aws-lambda-trigger" {
  bucket = aws_s3_bucket.input.id
  lambda_function {
    lambda_function_arn = aws_lambda_function.translate_lambda.arn
    events              = ["s3:ObjectCreated:*"]

  }
}
resource "aws_lambda_permission" "test" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.translate_lambda.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${aws_s3_bucket.input.id}"
}
