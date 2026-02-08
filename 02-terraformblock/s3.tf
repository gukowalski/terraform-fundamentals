resource "aws_s3_bucket" "mybucket" {
  bucket = "mybucket-${random_id.server.hex}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}