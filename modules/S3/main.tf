provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "default" {
  bucket = "sulav7-lf-test-s3-bucket"

  # Tags
  tags = merge(
    var.additional_tags,
    {
      Name      = "sulav7-lf-test-s3-bucket"
      Deletable = "Yes",
      Project   = "Intern",
      Creator   = "sulav.adk.7@gmail.com",
    }
  )
}


resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.default.id
  key    = each.value

  content_type = lookup({
    "html" = "text/html",
    "css"  = "text/css",
    "js"   = "application/javascript",
    "json" = "application/json",
    "png"  = "image/png",
    "jpg"  = "image/jpeg",
    "jpeg" = "image/jpeg",
    "svg"  = "image/svg+xml"
  }, element(split(".", basename(each.value)), length(split(".", basename(each.value))) - 1), "binary/octet-stream")
  
  for_each = fileset("/home/sulav/Desktop/teraformcidc/dist", "**/*")

  source = "/home/sulav/Desktop/teraformcidc/dist/${each.value}"
}
