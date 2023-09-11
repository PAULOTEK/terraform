resource "aws_s3_bucket" "first_bucket" {
  bucket = "terraform-bucket"

}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.first_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}