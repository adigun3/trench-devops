resource "aws_key_pair" "olufemi-IAM-keypair" {
  key_name   = "olufemi-IAM-keypair"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
  lifecycle {
    ignore_changes = [public_key]
  }
}

