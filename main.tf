module "s3-lock" {
    source = "./modules/S3-lock"
  
}

module "db-lock" {
    source = "./modules/DB-lock"
  
}


module "S3" {
    source = "./modules/S3"  
}