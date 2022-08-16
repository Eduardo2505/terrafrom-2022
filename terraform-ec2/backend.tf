terraform {
  backend "s3" {
    bucket     = "bucket-backet-terraform-daynet"
    key        = "dev"
    region     = "us-east-1"
    encrypt    = true
    kms_key_id = "arn:aws:kms:us-east-1:619989790228:key/a7025e8e-b7c9-4eeb-9df5-32c0f454a632"
  }
}