terraform {
 backend "s3" {
   region         = "eu-west-1"
   bucket         = "tf-article"
   key            = "terraform.tfstate"
   encrypt        = "true"
   dynamodb_table = "tf-article-statelock"
 }
}