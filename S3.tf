variable "inputs3" {
  description = "input S3 name"
}
variable "outputs3" {
  description = "output s3 name"
}
resource "aws_s3_bucket" "input" {
  bucket        = var.inputs3
  force_destroy = true

  tags = {
    Name = "translate"
  }
}

resource "aws_s3_bucket" "output" {
  bucket        = var.outputs3
  force_destroy = true

  tags = {
    Name = "translate"
  }
}

